---
title: "HTMLFormElement: thuộc tính length"
short-title: length
slug: Web/API/HTMLFormElement/length
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.length
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`HTMLFormElement.length`** trả về số lượng điều khiển trong phần tử {{HTMLElement("form")}}.

Bạn có thể truy cập danh sách các điều khiển của biểu mẫu bằng thuộc tính {{domxref("HTMLFormElement.elements", "elements")}}.

Điều này bao gồm cả các phần tử là hậu duệ của phần tử `<form>` cũng như các phần tử được làm thành viên của biểu mẫu bằng thuộc tính `form` của chúng.

Các phần tử được tính cho thuộc tính này là: {{HTMLElement("button")}},
{{HTMLElement("fieldset")}}, {{HTMLElement("input")}} (ngoại trừ bất kỳ phần tử nào có type là "image" bị loại bỏ vì lý do lịch sử),
{{HTMLElement("object")}}, {{HTMLElement("output")}}, {{HTMLElement("select")}},
và {{HTMLElement("textarea")}}.

## Giá trị

Một số.

## Ví dụ

```js
if (document.getElementById("form1").length > 1) {
  // có nhiều hơn một điều khiển biểu mẫu ở đây
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
