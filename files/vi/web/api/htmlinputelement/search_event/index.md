---
title: "HTMLInputElement: sự kiện search"
short-title: search
slug: Web/API/HTMLInputElement/search_event
page-type: web-api-event
status:
  - non-standard
browser-compat: api.HTMLInputElement.search_event
---

{{APIRef("HTML DOM")}}{{non-standard_header}}

Sự kiện **`search`** được kích hoạt khi một tìm kiếm được khởi tạo bằng cách sử dụng phần tử {{HTMLElement("input")}} loại `type="search"`.

Có nhiều cách để khởi tạo tìm kiếm, chẳng hạn như nhấn <kbd>Enter</kbd> khi {{HTMLElement("input")}} đang được focus, hoặc nếu thuộc tính [`incremental`](/en-US/docs/Web/HTML/Reference/Elements/input#incremental) hiện diện, sau khi thời gian timeout do UA định nghĩa trôi qua kể từ lần nhấn phím gần nhất (với các lần nhấn phím mới đặt lại thời gian timeout để việc kích hoạt sự kiện được {{glossary("debounce", "debounce")}}).

Các triển khai UA hiện tại của `<input type="search">` có thêm một điều khiển để xóa trường. Sử dụng điều khiển này cũng kích hoạt sự kiện `search`. Trong trường hợp đó, `value` của phần tử {{HTMLElement("input")}} sẽ là chuỗi rỗng.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("search", (event) => { })

onsearch = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// phiên bản addEventListener
const input = document.querySelector('input[type="search"]');

input.addEventListener("search", () => {
  console.log(`Thuật ngữ tìm kiếm là ${input.value}`);
});
```

```js
// phiên bản onsearch
const input = document.querySelector('input[type="search"]');

input.onsearch = () => {
  console.log(`Thuật ngữ tìm kiếm là ${input.value}`);
};
```

## Đặc tả kỹ thuật

Sự kiện này không thuộc bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}
