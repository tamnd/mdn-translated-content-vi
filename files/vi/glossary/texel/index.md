---
title: Texel
slug: Glossary/Texel
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong đồ họa 3D, một **texel** là một pixel đơn lẻ trong một texture. _Texture_ là các hình ảnh được hiển thị trên bề mặt của đa giác trong một hình ảnh kết xuất 3D. Một texture được đặc trưng bởi tập hợp các texel, tương tự như cách một hình ảnh được đặc trưng bởi tập hợp các pixel.

Một pixel trong file ảnh raster là một chuỗi các bit chứa dữ liệu màu sắc, và đôi khi cả dữ liệu độ trong suốt, được ánh xạ đến các pixel hiển thị trên thiết bị đầu ra như màn hình máy tính. Khi một pixel thuộc về hình ảnh được dùng làm tài nguyên texture, nó được gọi là "texture pixel" hay viết tắt là "texel". Thay vì ánh xạ trực tiếp đến pixel màn hình, dữ liệu của texel được ánh xạ đến một vị trí trong không gian tọa độ của đối tượng 3D đang được mô hình hóa. Texture có thể được dùng để truyền đạt màu sắc và các đặc tính bề mặt khác như độ sâu và phản chiếu. Nhiều texture có thể được xếp chồng lên nhau để tạo ra các lớp phủ bề mặt phức tạp.

Quá trình ánh xạ các texel thích hợp đến các điểm tương ứng trên đa giác được gọi là **texture mapping** (ánh xạ texture). Ánh xạ texture là một giai đoạn trong quá trình kết xuất hình ảnh 3D để hiển thị. Khi lưới texel nguồn và lưới pixel đích không khớp, **lọc texture** (texture filtering) bổ sung được áp dụng để làm mịn các pixel kết quả đã được ánh xạ texture (phóng to hoặc thu nhỏ texture). Đầu ra cuối cùng của quá trình kết xuất là một hình chiếu 2D phẳng của mô hình 3D, trong đó texture đã được "bọc" quanh mô hình.

Trong quá trình kết xuất, ánh xạ texture thường được thực hiện trước khi chiếu sáng cảnh; tuy nhiên, trong WebGL, việc chiếu sáng được thực hiện như một phần của quá trình ánh xạ texture.

## Xem thêm

- [Texel (graphics)](<https://en.wikipedia.org/wiki/Texel_(graphics)>) trên Wikipedia
- [Texture mapping](https://en.wikipedia.org/wiki/Texture_mapping) trên Wikipedia
- [Texture filtering](https://en.wikipedia.org/wiki/Texture_filtering) trên Wikipedia
- [Sử dụng texture trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL)
- [Chiếu sáng trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Lighting_in_WebGL)
- [Hoạt hóa texture trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL)
