---
title: "Document: scrollsnapchange event"
short-title: scrollsnapchange
slug: Web/API/Document/scrollsnapchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Document.scrollsnapchange_event
---

{{APIRef}}{{SeeCompatTable}}

Sự kiện **`scrollsnapchange`** của giao diện {{domxref("Document")}} được kích hoạt trên [vùng chứa cuộn](/en-US/docs/Glossary/Scroll_container) của tài liệu khi kết thúc thao tác cuộn khi một mục snap cuộn mới được chọn.

Sự kiện này hoạt động tương tự như sự kiện [`scrollsnapchange`](/en-US/docs/Web/API/Element/scrollsnapchange_event) của giao diện {{domxref("Element")}}, ngoại trừ việc tài liệu HTML tổng thể phải được đặt làm vùng chứa snap cuộn (tức là {{cssxref("scroll-snap-type")}} được đặt trên phần tử {{htmlelement("html")}}).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scrollsnapchange", (event) => { })

onscrollsnapchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("SnapEvent")}}, kế thừa từ kiểu {{domxref("Event")}} chung.

## Ví dụ

### Sử dụng cơ bản

Giả sử chúng ta có một phần tử {{htmlelement("main")}} chứa nội dung đáng kể khiến nó cuộn:

```html
<main>
  <!-- Significant content -->
</main>
```

Phần tử `<main>` có thể được biến thành vùng chứa cuộn bằng cách kết hợp các thuộc tính CSS, ví dụ:

```css
main {
  width: 250px;
  height: 450px;
  overflow: scroll;
}
```

Chúng ta có thể triển khai hành vi snap cuộn trên nội dung đang cuộn bằng cách chỉ định thuộc tính {{cssxref("scroll-snap-type")}} trên phần tử {{htmlelement("html")}}:

```css
html {
  scroll-snap-type: block mandatory;
}
```

Đoạn mã JavaScript sau đây sẽ khiến sự kiện `scrollsnapchange` được kích hoạt trên tài liệu HTML khi một phần tử con của `<main>` trở thành mục snap mới được chọn. Trong hàm xử lý, chúng ta đặt lớp `selected` trên phần tử con được tham chiếu bởi {{domxref("SnapEvent.snapTargetBlock")}}, có thể được sử dụng để tạo kiểu cho nó trông như đã được chọn (ví dụ: với một animation) khi sự kiện được kích hoạt.

```js
document.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.classList.add("selected");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Document/scrollsnapchanging_event", "scrollsnapchanging")}}
- Sự kiện {{DOMxRef("Document/scrollend_event", "scrollend")}}
- {{domxref("SnapEvent")}}
- Thuộc tính CSS {{cssxref("scroll-snap-type")}}
- [Mô-đun CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Sử dụng sự kiện scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
