---
title: Houdini APIs
slug: Web/API/Houdini_APIs
page-type: guide
---

{{DefaultAPISidebar("Houdini API")}}

Houdini là một tập hợp các API cấp thấp, cung cấp quyền truy cập vào các phần của CSS engine, trao cho nhà phát triển khả năng mở rộng CSS bằng cách kết nối vào quá trình tạo kiểu và bố cục của công cụ render trình duyệt. Houdini là nhóm các API cho phép nhà phát triển truy cập trực tiếp vào [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) (CSSOM), cho phép viết mã mà trình duyệt có thể phân tích như CSS, qua đó tạo ra các tính năng CSS mới mà không cần chờ chúng được triển khai tự nhiên trong trình duyệt.

## Ưu điểm của Houdini

Houdini cho phép thời gian phân tích nhanh hơn so với việc sử dụng JavaScript {{domxref("HTMLElement.style")}} cho các thay đổi kiểu. Trình duyệt phân tích CSSOM — bao gồm các quá trình layout, paint và composite — trước khi áp dụng bất kỳ cập nhật kiểu nào được tìm thấy trong các tập lệnh. Ngoài ra, các quá trình layout, paint và composite được lặp lại cho các cập nhật kiểu JavaScript. Mã Houdini không chờ chu kỳ render đầu tiên hoàn thành. Thay vào đó, nó được bao gồm trong chu kỳ đầu tiên đó — tạo ra các kiểu có thể render và hiểu được. Houdini cung cấp API dựa trên đối tượng để làm việc với các giá trị CSS trong JavaScript.

[CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) của Houdini là một CSS Object Model với các kiểu và phương thức, cung cấp các giá trị dưới dạng đối tượng JavaScript, giúp thao tác CSS trực quan hơn so với việc thao tác chuỗi {{domxref("HTMLElement.style")}} trước đây. Mỗi phần tử và quy tắc bảng kiểu đều có một bản đồ kiểu có thể truy cập thông qua {{domxref("StylePropertyMap")}}.

Một tính năng của CSS Houdini là {{domxref("Worklet")}}. Với worklets, bạn có thể tạo các CSS dạng module, chỉ cần một dòng JavaScript để nhập các thành phần có thể cấu hình: không cần tiền xử lý, hậu xử lý hay framework JavaScript.

```js
CSS.paintWorklet.addModule("css-component.js");
```

Module được thêm này chứa các hàm {{domxref("PaintWorkletGlobalScope.registerPaint")}}, đăng ký các worklet hoàn toàn có thể cấu hình.

Hàm CSS `paint()` là một hàm bổ sung được hỗ trợ bởi kiểu {{cssxref("image")}}. Nó nhận các tham số bao gồm tên của worklet cùng các tham số bổ sung mà worklet cần. Worklet cũng có quyền truy cập vào các thuộc tính tùy chỉnh của phần tử: chúng không cần được truyền dưới dạng đối số hàm.

Trong ví dụ sau, hàm `paint()` được truyền một worklet có tên `my-component`:

```css
li {
  background-image: paint(my-component, stroke, 10px);
  --highlights: blue;
  --theme: green;
}
```

> [!NOTE]
> Quyền lực lớn đi kèm trách nhiệm lớn!
> Với Houdini bạn _có thể_ tự tạo triển khai masonry, grid hay regions của riêng mình,
> nhưng làm vậy không nhất thiết là ý tưởng tốt nhất.
> CSS Working group thực hiện nhiều công việc để đảm bảo mỗi tính năng đều hiệu quả,
> xử lý tất cả các trường hợp ngoại lệ và tính đến bảo mật, quyền riêng tư và khả năng tiếp cận.
> Khi bạn mở rộng CSS với Houdini, hãy nhớ những cân nhắc này,
> và bắt đầu nhỏ trước khi chuyển sang các dự án tham vọng hơn.

## Các Houdini API

Dưới đây là các liên kết đến các trang tham khảo chính bao gồm các API thuộc Houdini, cùng các liên kết đến hướng dẫn giúp bạn tìm hiểu cách sử dụng chúng.

### CSS Properties and Values API

Xác định API để đăng ký các thuộc tính CSS mới. Các thuộc tính được đăng ký bằng API này được cung cấp cú pháp phân tích xác định kiểu, hành vi kế thừa và giá trị ban đầu.

- [Tham khảo CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- [Hướng dẫn CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide)
- [Smarter custom properties with Houdini's new API](https://web.dev/articles/css-props-and-vals)

### CSS Typed OM

Chuyển đổi chuỗi giá trị CSSOM sang các biểu diễn JavaScript có kiểu và ngược lại có thể gây ra chi phí hiệu suất đáng kể. CSS Typed OM cung cấp các giá trị CSS dưới dạng đối tượng JavaScript có kiểu để cho phép thao tác hiệu quả.

- [Tham khảo CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Hướng dẫn CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [Working with the new CSS Typed Object Model](https://developer.chrome.com/docs/css-ui/cssom)

### CSS Painting API

Được phát triển để cải thiện khả năng mở rộng của CSS, Painting API cho phép nhà phát triển viết các hàm JavaScript có thể vẽ trực tiếp vào nền, viền hoặc nội dung của phần tử thông qua hàm CSS `paint()`.

- [Tham khảo CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Hướng dẫn CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)
- [CSS Paint API](https://developer.chrome.com/blog/paintapi/)

### Worklets

API để chạy các tập lệnh trong các giai đoạn khác nhau của pipeline render độc lập với môi trường thực thi JavaScript chính. Worklets về mặt khái niệm tương tự [Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers), và được gọi bởi và mở rộng công cụ render.

- [Tham khảo Worklets](/en-US/docs/Web/API/Worklet)

### CSS Layout API

Được thiết kế để cải thiện khả năng mở rộng của CSS, API này cho phép nhà phát triển viết các thuật toán bố cục của riêng mình, như masonry hay line snapping.

_API này có một số hỗ trợ một phần trong Chrome Canary. Chưa được ghi chép trên MDN._

### CSS Parser API

API cung cấp quyền truy cập trực tiếp hơn vào CSS parser, để phân tích các ngôn ngữ giống CSS tùy ý thành biểu diễn có kiểu nhẹ.

_API này hiện là đề xuất và không có triển khai trình duyệt hay tài liệu trên MDN._

- [Đề xuất](https://github.com/WICG/css-parser-api)

### Font Metrics API

API cung cấp số liệu font, cho phép truy cập vào kết quả bố cục kiểu chữ.

_API này hiện là đề xuất và không có triển khai trình duyệt hay tài liệu trên MDN._

- [Đề xuất](https://github.com/w3c/css-houdini-drafts/blob/main/font-metrics-api/README.md)

## Xem thêm

- [A Practical Overview of CSS Houdini](https://www.smashingmagazine.com/2020/03/practical-overview-css-houdini/)
- [Smarter custom properties with Houdini's new API](https://web.dev/articles/css-props-and-vals)
