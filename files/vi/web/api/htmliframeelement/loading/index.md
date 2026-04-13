---
title: "HTMLIFrameElement: thuộc tính loading"
short-title: loading
slug: Web/API/HTMLIFrameElement/loading
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.loading
---

{{APIRef("HTML DOM")}}

Thuộc tính **`loading`** của giao diện {{domxref("HTMLIFrameElement")}} là một chuỗi cung cấp gợi ý cho trình duyệt về việc [iframe](/en-US/docs/Web/HTML/Reference/Elements/iframe) nên được tải ngay lập tức khi trang tải, hay chỉ khi cần thiết.

Điều này có thể được sử dụng để tối ưu hóa việc tải nội dung tài liệu.
Các iframe hiển thị khi trang tải có thể được tải xuống ngay lập tức (eagerly), trong khi các iframe có khả năng nằm ngoài màn hình khi trang tải ban đầu có thể được tải xuống một cách lười biếng (lazily) — ngay trước khi chúng xuất hiện trong {{Glossary("visual viewport")}} của cửa sổ.

## Giá trị

Một chuỗi cung cấp gợi ý cho user agent về cách lên lịch tải iframe tốt nhất.
Các giá trị có thể là:

- `eager`
  - : Tải iframe ngay khi phần tử được xử lý.
    Đây là giá trị mặc định.
- `lazy`
  - : Tải iframe khi trình duyệt tin rằng nó có khả năng cần thiết trong tương lai gần.

## Ghi chú sử dụng

### JavaScript phải được bật

Vi trì hoãn tải chỉ hoạt động khi JavaScript được bật, bất kể giá trị của thuộc tính này.

Đây là một biện pháp chống theo dõi, bởi vì nếu user agent hỗ trợ tải lười biếng khi scripting bị vô hiệu hóa, vẫn có thể một trang web theo dõi vị trí cuộn gần đúng của người dùng trong suốt phiên làm việc, bằng cách chiến lược đặt các iframe trong markup của trang sao cho máy chủ có thể theo dõi có bao nhiêu iframe được yêu cầu và khi nào.

### Thời điểm của sự kiện load

Sự kiện {{domxref("Window.load_event", "load")}} được kích hoạt khi tài liệu đã được xử lý hoàn toàn.

Các iframe tải lười biếng không ảnh hưởng đến thời điểm của sự kiện `load` ngay cả khi iframe nằm trong visual viewport và do đó được tìm nạp khi trang tải.
Tất cả các iframe tải eagerly trong tài liệu phải được tìm nạp trước khi sự kiện `load` có thể kích hoạt.

## Ví dụ

### Sử dụng cơ bản

Ví dụ dưới đây cho thấy cách bạn có thể định nghĩa một iframe tải lười biếng và sau đó thêm nó vào một `<div>` trong tài liệu.
Khung này sau đó chỉ được tải khi khung sắp trở nên hiển thị.

```js
// Định nghĩa iframe với tải lười biếng
const iframe = document.createElement("iframe");
iframe.src = "https://example.com";
iframe.width = 320;
iframe.height = 240;
iframe.loading = "lazy";

// Thêm vào phần tử div với class named frameDiv
const frameDiv = document.querySelector("div.frameDiv");
frameDiv.appendChild(iframe);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("iframe")}}
- [Learn: Hiệu suất web](/en-US/docs/Learn_web_development/Extensions/Performance)
- [Tải lười biếng](/en-US/docs/Web/Performance/Guides/Lazy_loading) trong hướng dẫn hiệu suất web MDN
- [Đã đến lúc tải lười biếng các iframe ngoài màn hình!](https://web.dev/articles/iframe-lazy-loading) trên web.dev
