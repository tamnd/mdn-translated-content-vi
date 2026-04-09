---
title: "BarProp: thuộc tính visible"
short-title: visible
slug: Web/API/BarProp/visible
page-type: web-api-instance-property
browser-compat: api.BarProp.visible
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`visible`** của giao diện {{domxref("BarProp")}} trả về `true` nếu phần tử giao diện người dùng mà nó biểu diễn đang hiển thị.

## Giá trị

Một {{jsxref("Boolean")}}, có giá trị `true` nếu cửa sổ cấp cao nhất được mở bằng {{domxref("window.open")}} với tính năng [`popup`](/en-US/docs/Web/API/Window/open#popup) được bật.

> [!NOTE]
> Trước đây, thuộc tính này biểu diễn việc phần tử giao diện đang dùng có hiển thị hay không. Tuy nhiên, vì lý do quyền riêng tư, điều này không còn phản ánh khả năng hiển thị thực tế của từng phần tử giao diện nữa.

## Ví dụ

Ví dụ sau in `true` ra console nếu cửa sổ không phải là popup.

```js
console.log(window.locationbar.visible);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
