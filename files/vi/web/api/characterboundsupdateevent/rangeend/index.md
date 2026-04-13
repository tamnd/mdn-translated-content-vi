---
title: "CharacterBoundsUpdateEvent: thuộc tính rangeEnd"
short-title: rangeEnd
slug: Web/API/CharacterBoundsUpdateEvent/rangeEnd
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CharacterBoundsUpdateEvent.rangeEnd
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`CharacterBoundsUpdateEvent.rangeEnd`** biểu diễn độ lệch của ký tự cuối cùng trong vùng văn bản có thể chỉnh sửa mà hệ điều hành cần biết ranh giới.

## Giá trị

Một {{jsxref("Number")}}.

## Ví dụ

### Đọc giá trị `rangeEnd`

Ví dụ này minh họa cách sử dụng sự kiện `characterboundsupdate` và đọc giá trị của các thuộc tính `rangeStart` và `rangeEnd`.

```js
const editContext = new EditContext();
editorElement.editContext = editContext;

editContext.addEventListener("characterboundsupdate", (e) => {
  console.log(
    `The OS needs the bounds of the chars at ${e.rangeStart} - ${e.rangeEnd}.`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
