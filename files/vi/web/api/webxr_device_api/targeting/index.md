---
title: Targeting and hit detection
slug: Web/API/WebXR_Device_API/Targeting
page-type: guide
---

{{DefaultAPISidebar("WebXR Device API")}}

## Virtual object hit testing

Việc phát hiện va chạm với các đối tượng ảo thường không thực sự kiểm tra giao điểm giữa tia và một trong các đa giác của cảnh, vì một cảnh điển hình có thể có hàng trăm hoặc hàng nghìn đa giác, khiến việc lần tia trực tiếp tới đa giác trở nên không thực tế trong hầu hết trường hợp. Thay vào đó, phần lớn ứng dụng tìm cách đơn giản hóa việc triển khai thuật toán kiểm tra va chạm.

Có khả năng, thậm chí rất có thể, công cụ đồ họa 3D bạn đang dùng đã hỗ trợ hit testing, đặc biệt nếu nó được thiết kế riêng cho phát triển game.

### Simplified representative objects

Một giải pháp phổ biến là chồng các đối tượng đơn giản, vô hình lên trên các đối tượng trong cảnh của bạn. Những đối tượng này sau đó sẽ đóng vai trò thay thế. Ví dụ, nếu bạn có một đối tượng gần như hình chữ nhật, hãy dùng một hình chữ nhật làm vật thế thân khi kiểm tra va chạm. Tương tự, nếu một đối tượng về cơ bản là hình tròn, hãy dùng bán kính của đường tròn bao nhỏ nhất để xác lập một đối tượng kiểm tra va chạm.

## Real-world hit testing

Từ viết tắt "LIDAR" có nhiều cách diễn giải tùy theo chi tiết triển khai, nhưng kết quả cuối cùng thì giống nhau. Thường gặp nhất, nó chỉ "_Laser Imaging, Detection, And Ranging_" hoặc "_LIght Detection and Ranging_").

Kiểm tra va chạm với thế giới thực là một vấn đề khác, có thể không chỉ liên quan đến việc diễn giải hình ảnh từ camera của thiết bị (nếu có) mà còn có thể dùng thêm nhiều cảm biến bổ sung. Một số thiết bị có cảm biến hồng ngoại để đo khoảng cách tới vật thể, còn một số khác cung cấp các hệ thống [LIDAR](https://en.wikipedia.org/wiki/LIDAR) mạnh mẽ, dùng laser (thường là laser hồng ngoại, không thể nhìn thấy bằng mắt người) để xác định khoảng cách đến các vật thể trong thế giới thực.

Chi tiết về cách làm việc với hệ thống đo khoảng cách của từng nền tảng cụ thể nằm ngoài phạm vi của bài viết này. Tuy nhiên, vẫn có hy vọng: đã có một đề xuất về WebXR Hit Test Module sẽ được chồng lên WebXR để cung cấp một API cho việc thực hiện hit testing và phát hiện va chạm.

## See also

- [Phát hiện va chạm 3D](/en-US/docs/Games/Techniques/3D_collision_detection)
- [HTML5 games: phát hiện va chạm 3D](https://hacks.mozilla.org/2015/10/html-5-games-3d-collision-detection/) (Hacks blog)
