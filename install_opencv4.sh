# Step 1 – updating Ubuntu
sudo apt-get update && sudo apt-get upgrade -y

# Step 2 – install dependencies
sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get install python3.5-dev python3-numpy libtbb2 libtbb-dev

sudo apt-get install libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev \
  libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common \
  libtbb-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev \
  libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev

# Step 3 –  get OpenCV
sudo -s

cd /opt/

git clone https://github.com/Itseez/opencv.git

git clone https://github.com/Itseez/opencv_contrib.git

# Step 4 – build and install OpenCV
cd opencv

mkdir release

cd release

cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_OPENGL=OFF \
  -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF \
  -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
  -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules /opt/opencv/

make -j4

make install

ldconfig

exit

cd

# Step 5 - install and update apt-file
sudo apt-get install apt-file

sudo apt-file update

# Step 6 - search by opencv.pc and install libopencv-dev
apt-file search opencv.pc

sudo apt-get instal libopencv-dev

# Step 7 - check pkg-config of cflags and libs of opencv4
pkg-config --cflags opencv4

pkg-config --libs opencv4
