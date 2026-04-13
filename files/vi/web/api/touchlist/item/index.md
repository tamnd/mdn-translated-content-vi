---
title: "TouchList: item() method"
short-title: item()
slug: Web/API/TouchList/item
page-type: web-api-instance-method
browser-compat: api.TouchList.item
---

{{ APIRef("Touch Events") }}

Phương thức **`item()`** trả về đối tượng {{ domxref("Touch") }} tại chỉ số được chỉ định trong {{ domxref("TouchList") }}.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ số của đối tượng {{ domxref("Touch") }} cần lấy. Chỉ số là một số trong phạm vi từ 0 đến một giá trị nhỏ hơn chiều dài của {{ domxref("TouchList") }}.

### Giá trị trả về

Đối tượng {{ domxref("Touch") }} được yêu cầu từ {{ domxref("TouchList") }}. Trả về `null` nếu chỉ số không nhỏ hơn chiều dài của danh sách.

## Ví dụ

Ví dụ mã này minh họa cách sử dụng phương thức `item` của giao diện {{domxref("TouchList")}} và thuộc tính {{domxref("TouchList.length","length")}}.

```js
const target = document.getElementById("target");

target.addEventListener("touchstart", (ev) => {
  // Nếu sự kiện touchstart này bắt đầu trên phần tử target,
  // đặt touch thành mục đầu tiên trong danh sách targetTouches;
  // nếu không, đặt touch thành mục đầu tiên trong danh sách touches
  const touch =
    ev.targetTouches.length >= 1
      ? ev.targetTouches.item(0)
      : ev.touches.item(0);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
