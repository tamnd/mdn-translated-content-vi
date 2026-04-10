---
title: "Document: phương thức createTouchList()"
short-title: createTouchList()
slug: Web/API/Document/createTouchList
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.createTouchList
---

{{APIRef("DOM")}}{{Deprecated_Header}}{{Non-standard_header}}

Phương thức **`Document.createTouchList()`** tạo và trả về một đối tượng {{DOMxRef("TouchList")}} mới.

## Cú pháp

```js-nolint
createTouchList(touch1)
createTouchList(touch1, touch2)
createTouchList(touch1, touch2, /* …, */ touchN)
```

### Tham số

- `touch1`, …, `touchN`
  - : Không hoặc nhiều đối tượng {{DOMxRef("Touch")}}. Firefox cũng chấp nhận một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) các đối tượng {{DOMxRef("Touch")}}.

### Giá trị trả về

Một đối tượng {{DOMxRef("TouchList")}} chứa các đối tượng {{DOMxRef("Touch")}} được chỉ định bởi tham số `touches`.

## Ví dụ

Ví dụ này minh họa việc sử dụng phương thức `Document.createTouchList()` để tạo các đối tượng {{DOMxRef("TouchList")}}.

Trong đoạn mã sau, một số đối tượng {{DOMxRef("Touch")}} được tạo cho phần tử `target` và các điểm touch này sau đó được sử dụng để tạo một số đối tượng {{DOMxRef("TouchList")}}.

```js
const target = document.getElementById("target");

// Create some touch points
const touch1 = document.createTouch(window, target, 1, 15, 20, 35, 40);
const touch2 = document.createTouch(window, target, 2, 25, 30, 45, 50);

// Create an empty TouchList objects
const list0 = document.createTouchList();

// Create a TouchList with only one Touch object
const list1 = document.createTouchList(touch1);

// Create a list with two Touch objects
const list2 = document.createTouchList(touch1, touch2);
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của bất kỳ đặc tả kỹ thuật hiện tại nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Touch events](/en-US/docs/Web/API/Touch_events)
- {{DOMxRef("Touch")}}
- {{DOMxRef("TouchEvent")}}
- {{DOMxRef("TouchList")}}
- {{DOMxRef("Document.createTouch()")}}
