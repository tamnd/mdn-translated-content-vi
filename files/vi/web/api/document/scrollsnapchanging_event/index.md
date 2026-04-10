---
title: "Document: scrollsnapchanging event"
short-title: scrollsnapchanging
slug: Web/API/Document/scrollsnapchanging_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Document.scrollsnapchanging_event
---

{{APIRef}}{{SeeCompatTable}}

Sự kiện **`scrollsnapchanging`** của giao diện {{domxref("Document")}} được kích hoạt trên [vùng chứa cuộn](/en-US/docs/Glossary/Scroll_container) khi trình duyệt xác định một mục snap cuộn mới đang chờ xử lý, tức là nó sẽ được chọn khi cử chỉ cuộn hiện tại kết thúc.

Sự kiện này hoạt động tương tự như sự kiện [`scrollsnapchanging`](/en-US/docs/Web/API/Element/scrollsnapchanging_event) của giao diện {{domxref("Element")}}, ngoại trừ việc tài liệu HTML tổng thể phải được đặt làm vùng chứa snap cuộn (tức là {{cssxref("scroll-snap-type")}} được đặt trên phần tử {{htmlelement("html")}}).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scrollsnapchanging", (event) => { })

onscrollsnapchanging = (event) => { }
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

Đoạn mã JavaScript sau đây sẽ khiến sự kiện `scrollsnapchanging` được kích hoạt trên tài liệu HTML khi một phần tử con của `<main>` trở thành mục snap đang chờ xử lý. Trong hàm xử lý, chúng ta đặt lớp `pending` trên phần tử con được tham chiếu bởi thuộc tính {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}}, có thể được sử dụng để tạo kiểu khác đi khi sự kiện được kích hoạt.

```js
document.addEventListener("scrollsnapchanging", (event) => {
  // xóa các lớp "pending" đã đặt trước đó
  const pendingElems = document.querySelectorAll(".pending");
  pendingElems.forEach((elem) => {
    elem.classList.remove("pending");
  });

  // Đặt lớp mục snap đang chờ hiện tại thành "pending"
  event.snapTargetBlock.classList.add("pending");
});
```

Ở đầu hàm, chúng ta chọn tất cả các phần tử trước đó đã áp dụng lớp `pending` và xóa nó, để chỉ mục tiêu snap đang chờ gần nhất được tạo kiểu.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Document/scrollsnapchange_event", "scrollsnapchange")}}
- Sự kiện {{DOMxRef("Document/scrollend_event", "scrollend")}}
- {{domxref("SnapEvent")}}
- Thuộc tính CSS {{cssxref("scroll-snap-type")}}
- [Mô-đun CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Sử dụng sự kiện scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
