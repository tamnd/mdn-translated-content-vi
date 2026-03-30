---
title: API web phía máy khách
slug: Learn_web_development/Extensions/Client-side_APIs
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Client-side_APIs/Introduction", "Learn_web_development/Extensions")}}

**Giao diện lập trình ứng dụng** (**API**) là các tính năng lập trình cho phép thao tác với các khía cạnh khác nhau của trình duyệt và hệ điều hành mà trang web đang chạy trên đó, hoặc thao tác với dữ liệu từ các trang web hay dịch vụ khác. Mô-đun này bao gồm các khía cạnh phổ biến của một số lớp API Web thông dụng nhất mà chúng ta chưa đề cập chi tiết trước đây, cung cấp nền tảng hữu ích cho những ai muốn tìm hiểu sâu hơn về cách sử dụng API trình duyệt.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn thực sự nên đã học các kiến thức cơ bản về [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting), đặc biệt là [kiến thức cơ bản về đối tượng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics) và kiến thức cốt lõi về API như [lập trình DOM](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting) và [Yêu cầu mạng](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests).

Sẽ hữu ích nếu bạn có một số kiến thức về [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) và [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics).

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác mà bạn không thể tạo tệp, bạn có thể thử chạy mã trong trình chỉnh sửa trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn

- [Giới thiệu về API web](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Introduction)
  - : Đầu tiên, chúng ta sẽ bắt đầu bằng cách nhìn nhận các API ở cấp độ cao — chúng là gì, chúng hoạt động như thế nào, cách sử dụng chúng trong mã của bạn, và chúng được cấu trúc như thế nào? Chúng ta cũng sẽ xem xét các lớp API chính là gì và chúng có những ứng dụng như thế nào.
- [API âm thanh và video](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs)
  - : HTML đi kèm với các phần tử để nhúng đa phương tiện vào tài liệu — {{htmlelement("video")}} và {{htmlelement("audio")}} — và chúng có các API riêng để điều khiển phát lại, tìm kiếm, v.v. Bài viết này hướng dẫn bạn thực hiện các tác vụ thông thường như tạo các điều khiển phát lại tùy chỉnh.
- [Vẽ đồ họa](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics)
  - : Trình duyệt có một số công cụ lập trình đồ họa rất mạnh mẽ, từ ngôn ngữ Đồ họa Vector có thể mở rộng ([SVG](/en-US/docs/Web/SVG)), đến các API để vẽ trên các phần tử HTML {{htmlelement("canvas")}}, (xem [Canvas API](/en-US/docs/Web/API/Canvas_API) và [WebGL](/en-US/docs/Web/API/WebGL_API)). Bài viết này cung cấp phần giới thiệu về Canvas API và các tài nguyên khác để bạn có thể tìm hiểu thêm.
- [Lưu trữ phía máy khách](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Client-side_storage)
  - : Các trình duyệt web hiện đại có nhiều công nghệ khác nhau cho phép bạn lưu trữ dữ liệu liên quan đến trang web và truy xuất khi cần thiết, giúp bạn lưu trữ dữ liệu lâu dài, lưu trang web ngoại tuyến, và hơn thế nữa. Bài viết này giải thích những điều cơ bản về cách thức hoạt động của chúng.
- [API bên thứ ba](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Third_party_APIs)
  - : Các API chúng ta đã đề cập cho đến nay được tích hợp sẵn trong trình duyệt, nhưng không phải tất cả các API đều như vậy. Nhiều trang web và dịch vụ lớn như Google Maps, Facebook, PayPal, v.v. cung cấp các API cho phép nhà phát triển sử dụng dữ liệu hoặc dịch vụ của họ (ví dụ: hiển thị bản đồ Google Maps tùy chỉnh trên trang web của bạn, hoặc sử dụng đăng nhập Facebook để đăng nhập người dùng). Bài viết này xem xét sự khác biệt giữa API trình duyệt và API bên thứ ba, và cho thấy một số cách sử dụng điển hình của loại sau.

{{NextMenu("Learn_web_development/Extensions/Client-side_APIs/Introduction", "Learn_web_development/Extensions")}}
