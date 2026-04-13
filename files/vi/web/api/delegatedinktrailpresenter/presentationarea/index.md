---
title: "DelegatedInkTrailPresenter: presentationArea property"
short-title: presentationArea
slug: Web/API/DelegatedInkTrailPresenter/presentationArea
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DelegatedInkTrailPresenter.presentationArea
---

{{APIRef("Ink API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`presentationArea`** của giao diện {{domxref("DelegatedInkTrailPresenter")}} trả về {{domxref("Element")}} mà trong đó việc hiển thị các nét mực bị giới hạn.

Nếu lệnh gọi phương thức {{domxref("Ink.requestPresenter", "Ink.requestPresenter()")}} trước đó có bao gồm định nghĩa phần tử `presentationArea` cụ thể, thì đó sẽ là phần tử được trả về. Nếu không, mặc định được trả về, là viewport chứa.

Vùng này luôn là tọa độ client cho hộp viền của phần tử, vì vậy việc di chuyển hoặc cuộn phần tử không yêu cầu tính toán lại từ phía nhà phát triển.

## Giá trị

Một {{domxref("Element")}}.

## Ví dụ

```js
async function inkInit() {
  const ink = navigator.ink;
  const presenter = await ink.requestPresenter({ presentationArea: canvas });
  console.log(presenter.presentationArea);

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
