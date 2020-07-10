
source ./hooks/.config

export DOCKERFILE_PATH=Dockerfile.mirakurun
export IMAGE_NAME=mirakurun

echo "SOURCE_BRANCH:   $SOURCE_BRANCH"
echo "SOURCE_COMMIT:   $SOURCE_COMMIT"
echo "COMMIT_MSG:      $COMMIT_MSG"
echo "DOCKER_REPO:     $DOCKER_REPO"
echo "DOCKERFILE_PATH: $DOCKERFILE_PATH"
echo "CACHE_TAG:       $CACHE_TAG"
echo "IMAGE_NAME:      $IMAGE_NAME"

declare -A base_image_prefix_map=(["amd64"]="")
declare -A docker_qemu_arch_map=(["amd64"]="x86_64")

./hooks/pre_build

for arch in ${verified_build_architectures[@]}; do

  echo "##########################################################################################"
  echo "# ARCH $arch"
  echo "##########################################################################################"

  ARCH=${arch}
  BASE_IMAGE_PREFIX="${base_image_prefix_map[${arch}]}"
  docker build \
    --build-arg BASE_IMAGE_PREFIX=${BASE_IMAGE_PREFIX} \
    --build-arg ARCH=${ARCH} \
    --file ${DOCKERFILE_PATH} \
    --tag "${IMAGE_NAME}-${ARCH}"  \
    .
done

