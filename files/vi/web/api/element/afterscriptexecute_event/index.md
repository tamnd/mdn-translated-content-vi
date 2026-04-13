---
title: "Element: sự kiện afterscriptexecute"
short-title: afterscriptexecute
slug: Web/API/Element/afterscriptexecute_event
page-type: web-api-event
status:
  - deprecated
  - non-standard
browser-compat: api.Element.afterscriptexecute_event
---

{{APIRef}}{{Non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Sự kiện này là một đề xuất trong phiên bản đầu của đặc tả kỹ thuật. Không nên dựa vào nó.

Sự kiện **`afterscriptexecute`** được kích hoạt sau khi một tập lệnh đã được thực thi.

Đây là sự kiện độc quyền dành riêng cho Gecko (Firefox).

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("afterscriptexecute", (event) => { })

onafterscriptexecute = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Đặc tả kỹ thuật

Không nằm trong bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`beforescriptexecute`](/en-US/docs/Web/API/Element/beforescriptexecute_event)
