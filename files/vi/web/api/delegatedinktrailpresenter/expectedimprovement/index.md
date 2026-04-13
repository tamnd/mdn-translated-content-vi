---
title: "DelegatedInkTrailPresenter: expectedImprovement property"
short-title: expectedImprovement
slug: Web/API/DelegatedInkTrailPresenter/expectedImprovement
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.DelegatedInkTrailPresenter.expectedImprovement
---

{{APIRef("Ink API")}}{{Deprecated_header}}{{Non-Standard_Header}}

Thuộc tính chỉ đọc **`expectedImprovement`** của giao diện {{domxref("DelegatedInkTrailPresenter")}} trả về giá trị, tính bằng mili giây, cho biết mức độ cải thiện độ trễ có thể mong đợi khi sử dụng presenter này.

## Giá trị

Một số.

## Ví dụ

```js
async function inkInit() {
  const ink = navigator.ink;
  const presenter = await ink.requestPresenter({ presentationArea: canvas });
  console.log(presenter.expectedImprovement);

  // …
}
```

## Thông số kỹ thuật

Tính năng này không còn là một phần của thông số kỹ thuật.

## Tương thích trình duyệt

{{Compat}}
