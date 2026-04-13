---
title: MediaQueryList
slug: Web/API/MediaQueryList
page-type: web-api-interface
browser-compat: api.MediaQueryList
---

{{APIRef("CSSOM view API")}}

Đối tượng **`MediaQueryList`** lưu trữ thông tin về một [media query](/en-US/docs/Web/CSS/Guides/Media_queries) được áp dụng cho tài liệu, hỗ trợ cả việc khớp ngay lập tức và khớp dựa trên sự kiện so với trạng thái của tài liệu.

Bạn có thể tạo ra `MediaQueryList` bằng cách gọi {{DOMxRef("Window.matchMedia", "matchMedia()")}} trên đối tượng {{DOMxRef("window")}}. Đối tượng kết quả xử lý việc gửi thông báo đến các trình lắng nghe khi trạng thái media query thay đổi (tức là khi bài kiểm tra media query bắt đầu hoặc dừng đánh giá là `true`).

Điều này rất hữu ích cho thiết kế thích ứng, vì điều này giúp có thể quan sát tài liệu để phát hiện khi media query của nó thay đổi, thay vì kiểm tra giá trị định kỳ, và cho phép bạn thực hiện các thay đổi theo chương trình đối với tài liệu dựa trên trạng thái media query.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `MediaQueryList` kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("MediaQueryList.matches", "matches")}} {{ReadOnlyInline}}
  - : Một giá trị boolean trả về `true` nếu {{DOMxRef("document")}} hiện tại khớp với danh sách media query, hoặc `false` nếu không.
- {{DOMxRef("MediaQueryList.media", "media")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho media query đã được tuần tự hóa.

## Phương thức phiên bản

_Giao diện `MediaQueryList` kế thừa các phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("MediaQueryList.addListener", "addListener()")}} {{deprecated_inline}}
  - : Thêm vào `MediaQueryList` một callback được gọi bất cứ khi nào trạng thái media query, tức là tài liệu có khớp với các media query trong danh sách hay không, thay đổi. Phương thức này tồn tại chủ yếu để tương thích ngược; nếu có thể, bạn nên dùng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để theo dõi sự kiện {{domxref("MediaQueryList.change_event", "change")}}.
- {{DOMxRef("MediaQueryList.removeListener", "removeListener()")}} {{deprecated_inline}}
  - : Xóa callback trình lắng nghe được chỉ định khỏi các callback được gọi khi `MediaQueryList` thay đổi trạng thái media query, điều này xảy ra bất cứ khi nào tài liệu chuyển đổi giữa khớp và không khớp với các media query được liệt kê trong `MediaQueryList`. Phương thức này được giữ lại cho tương thích ngược; nếu có thể, bạn thường nên dùng {{domxref("EventTarget.removeEventListener", "removeEventListener()")}} để xóa các callback thông báo thay đổi (đã được thêm vào trước đó bằng `addEventListener()`).

## Sự kiện

_Các sự kiện sau đây được gửi đến các đối tượng `MediaQueryList`:_

- {{DOMxRef("MediaQueryList.change_event", "change")}}
  - : Được gửi đến `MediaQueryList` khi kết quả chạy media query so với tài liệu thay đổi. Ví dụ, nếu media query là `(width >= 400px)`, sự kiện `change` được kích hoạt bất cứ khi nào chiều rộng của {{Glossary("viewport")}} của tài liệu thay đổi sao cho chiều rộng của nó vượt qua ranh giới 400px theo cả hai hướng.

## Ví dụ

Ví dụ này tạo ra `MediaQueryList` và sau đó thiết lập trình lắng nghe để phát hiện khi trạng thái media query thay đổi, chạy hàm tùy chỉnh khi thay đổi đó xảy ra để thay đổi giao diện của trang.

```js
const para = document.querySelector("p");
const mql = window.matchMedia("(width <= 600px)");

function screenTest(e) {
  if (e.matches) {
    /* the viewport is 600 pixels wide or less */
    para.textContent = "This is a narrow screen — less than 600px wide.";
    document.body.style.backgroundColor = "red";
  } else {
    /* the viewport is more than 600 pixels wide */
    para.textContent = "This is a wide screen — more than 600px wide.";
    document.body.style.backgroundColor = "blue";
  }
}

mql.addEventListener("change", screenTest);
```

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub (xem [mã nguồn](https://github.com/mdn/dom-examples/blob/main/mediaquerylist/index.html), và cũng xem nó [chạy trực tiếp](https://mdn.github.io/dom-examples/mediaquerylist/index.html)).

Bạn có thể tìm thấy các ví dụ khác trên các trang thuộc tính và phương thức riêng lẻ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Sử dụng media query từ code](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- {{DOMxRef("window.matchMedia()")}}
- {{DOMxRef("MediaQueryListEvent")}}
- Bài viết {{DOMxRef("Window.devicePixelRatio")}} cũng có ví dụ hữu ích
