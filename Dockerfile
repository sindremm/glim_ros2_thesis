ARG BASE_IMAGE=koide3/glim_ros2:jazzy
FROM $BASE_IMAGE


WORKDIR /root/ros2_ws/src
RUN rm -rf glim_ros2/*
ADD . glim_ros2



WORKDIR /root/ros2_ws
RUN sed -i '104 i set(USE_SCOPED_HEADER_INSTALL_DIR TRUE)' /root/ros2_ws/src/glim_ros2/CMakeLists.txt
RUN rm -rf build/ log/
# RUN /ros_entrypoint.sh && colcon build --continue-on-error
#--symlink-install


# RUN apt-get update \
#   && apt-get install --no-install-recommends -y \
#     libfmt-dev libspdlog-dev libopencv-dev \
#   && apt-get clean \
#   && rm -rf /var/lib/apt/lists/*

# WORKDIR /root/ros2_ws/

# # Install gtsam
# RUN git clone https://github.com/borglab/gtsam
# RUN cd gtsam && git checkout 4.3a0
# RUN mkdir build && cd build
# RUN cmake .. -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
#          -DGTSAM_BUILD_TESTS=OFF \
#          -DGTSAM_WITH_TBB=OFF \
#          -DGTSAM_USE_SYSTEM_EIGEN=ON \
#          -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF
# RUN make -j$(nproc)
# RUN make install

# # without viewer and CUDA
# COPY . /root/glim
# WORKDIR /root/glim/build
# RUN cmake .. \
#   -DBUILD_WITH_CUDA=OFF \
#   -DBUILD_WITH_VIEWER=OFF \
#   -DBUILD_WITH_MARCH_NATIVE=OFF \
#   -DCMAKE_BUILD_TYPE=Release
# RUN  make -j$(nproc)

# # with viewer
# WORKDIR /root/glim/build
# RUN cmake .. \
#   -DBUILD_WITH_CUDA=OFF \
#   -DBUILD_WITH_VIEWER=ON \
#   -DBUILD_WITH_MARCH_NATIVE=OFF \
#   -DCMAKE_BUILD_TYPE=Release
# RUN make -j$(nproc)

CMD ["bash"]