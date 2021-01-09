double bootstrapContainerWidth(double width) {
  if (width >= 1200) {
    return 1140;
  }
  if (width >= 992) {
    return 960;
  }
  if (width >= 768) {
    return 720;
  }
  if (width >= 576) {
    return 540;
  }
  return width;
}