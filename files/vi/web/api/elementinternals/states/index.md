---
title: "ElementInternals: states property"
short-title: states
slug: Web/API/ElementInternals/states
page-type: web-api-instance-property
browser-compat: api.ElementInternals.states
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`states`** của giao diện {{domxref("ElementInternals")}} trả về {{domxref("CustomStateSet")}} đại diện cho các trạng thái có thể có của phần tử tùy chỉnh.

## Giá trị

Một {{domxref("CustomStateSet")}} là một {{jsxref("Set")}} các chuỗi.

## Ví dụ

Hàm sau thêm và xóa trạng thái `--checked` khỏi `CustomStateSet`, sau đó in ra console `true` hoặc `false` khi hộp kiểm tùy chỉnh được đánh dấu hoặc bỏ đánh dấu.

```js
class MyElement extends HTMLElement {
  set checked(flag) {
    if (flag) {
      this._internals.states.add("--checked");
    } else {
      this._internals.states.delete("--checked");
    }

    console.log(this._internals.states.has("--checked"));
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
