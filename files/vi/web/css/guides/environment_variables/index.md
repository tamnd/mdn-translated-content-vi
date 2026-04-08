---
title: CSS environment variables
short-title: Environment variables
slug: Web/CSS/Guides/Environment_variables
page-type: css-module
spec-urls: https://drafts.csswg.org/css-env-1
sidebar: cssref
---

Module **CSS environment variables** định nghĩa khái niệm environment variables và hàm {{cssxref("env")}}. Environment variables hoạt động tương tự như [custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*) và hàm {{cssxref("var")}}, ngoại trừ chúng được định nghĩa toàn cục; chúng là các biến toàn cục có phạm vi trên toàn bộ tài liệu. Chúng là các giá trị user agent, được cung cấp bởi trình duyệt hoặc hệ điều hành, mà bạn có thể truy cập bằng hàm {{cssxref("env")}}, cho phép bạn điều chỉnh styles của mình theo thiết bị hoặc ngữ cảnh của người dùng.

Environment variables cung cấp các giá trị có thể được sử dụng trên trang dựa trên thông tin mà user agent có quyền truy cập, chẳng hạn như kích thước thanh tiêu đề, bàn phím động và safe area insets. Safe area insets xác định một hình chữ nhật được đảm bảo hiển thị trên các màn hình không hình chữ nhật, dựa trên khoảng cách của nó từ các cạnh của viewport. Bạn có thể đưa kích thước user-agent vào styles của mình, cho phép bạn sửa đổi layout của nội dung thiết yếu dựa trên không gian có sẵn bên trong hình chữ nhật safe area, cạnh bàn phím động hiển thị hoặc liền kề thanh tiêu đề hiển thị.

## Tham khảo

### Functions

- {{cssxref("env")}}

### Kiểu dữ liệu

- [`<environment-variable-name>`](/en-US/docs/Web/CSS/Guides/Environment_variables/Using#browser-defined_environment_variables)

## Hướng dẫn

- [Using environment variables](/en-US/docs/Web/CSS/Guides/Environment_variables/Using)
  - : Tổng quan về environment variables là gì, các environment variables được định nghĩa bởi trình duyệt, và cách sử dụng hàm `env()`.

## Khái niệm liên quan

- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*)
- {{cssxref("var")}}
- {{domxref("VirtualKeyboard")}} interface
- Trường manifest [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override)
  [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API) và {{domxref("WindowControlsOverlay"))}} interface

## Đặc tả

{{Specifications}}

## Xem thêm

- Hướng dẫn [CSS value functions](/en-US/docs/Web/CSS/Reference/Values/Functions)
- Module [CSS properties and values API](/en-US/docs/Web/CSS/Guides/Properties_and_values_API)
- Module [CSS custom properties for cascading variables](/en-US/docs/Web/CSS/Guides/Cascading_variables)
