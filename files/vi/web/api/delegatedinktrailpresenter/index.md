---
title: DelegatedInkTrailPresenter
slug: Web/API/DelegatedInkTrailPresenter
page-type: web-api-interface
status:
  - experimental
browser-compat: api.DelegatedInkTrailPresenter
---

{{APIRef("Ink API")}}{{SeeCompatTable}}

Giao diện **`DelegatedInkTrailPresenter`** của [Ink API](/en-US/docs/Web/API/Ink_API) cung cấp khả năng hướng dẫn bộ tổng hợp cấp độ hệ điều hành hiển thị các nét mực giữa các lần gửi sự kiện con trỏ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("DelegatedInkTrailPresenter.expectedImprovement", "expectedImprovement")}} {{Deprecated_Inline}} {{Non-standard_Inline}} {{ReadOnlyInline}}
  - : Trả về giá trị, tính bằng mili giây, cho biết mức độ cải thiện độ trễ có thể mong đợi khi sử dụng presenter này.
- {{domxref("DelegatedInkTrailPresenter.presentationArea", "presentationArea")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Element")}} mà trong đó việc hiển thị các nét mực bị giới hạn.

## Phương thức phiên bản

- {{domxref("DelegatedInkTrailPresenter.updateInkTrailStartPoint", "updateInkTrailStartPoint()")}} {{Experimental_Inline}}
  - : Truyền {{domxref("PointerEvent")}} được sử dụng làm điểm hiển thị cuối cùng cho khung hiện tại, cho phép bộ tổng hợp cấp độ hệ điều hành hiển thị vệt mực ủy quyền trước sự kiện con trỏ tiếp theo được gửi.

## Ví dụ

Trong ví dụ này, chúng ta vẽ một vệt lên canvas 2D. Gần đầu mã, chúng ta gọi {{domxref("Ink.requestPresenter()")}}, truyền canvas làm vùng trình bày cho nó và lưu trữ promise nó trả về trong biến `presenter`.

Sau đó, trong trình nghe sự kiện `pointermove`, vị trí mới của đầu vệt được vẽ lên canvas mỗi lần sự kiện kích hoạt. Ngoài ra, đối tượng `DelegatedInkTrailPresenter` được trả về khi promise `presenter` hoàn thành có phương thức {{domxref("DelegatedInkTrailPresenter.updateInkTrailStartPoint", "updateInkTrailStartPoint()")}} được gọi; điều này được truyền:

- Sự kiện con trỏ đáng tin cậy cuối cùng đại diện cho điểm hiển thị cho khung hiện tại.
- Đối tượng `style` chứa cài đặt màu sắc và đường kính.

Kết quả là vệt mực ủy quyền được vẽ trước khi trình duyệt hiển thị mặc định thay mặt ứng dụng, theo kiểu đã chỉ định, cho đến lần tiếp theo nó nhận được sự kiện `pointermove`.

```js
const ctx = canvas.getContext("2d");
let presenter = navigator.ink.requestPresenter({ presentationArea: canvas });
let moveCnt = 0;
let style = { color: "rgb(0 0 255 / 100%)", diameter: 10 };

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

canvas.addEventListener("pointermove", (evt) => {
  const pointSize = 10;
  ctx.fillStyle = "black";
  ctx.fillRect(evt.pageX, evt.pageY, pointSize, pointSize);
  if (moveCnt === 50) {
    let r = getRandomInt(0, 255);
    let g = getRandomInt(0, 255);
    let b = getRandomInt(0, 255);
    style = {
      color: `rgb(${r} ${g} ${b} / 100%)`,
      diameter: 10,
    };
    moveCnt = 0;
    document.getElementById("div").style.backgroundColor =
      `rgb(${r} ${g} ${b} / 100%)`;
  }
  moveCnt += 1;
  presenter.then((v) => {
    v.updateInkTrailStartPoint(evt, style);
  });
});

window.addEventListener("pointerdown", (evt) => {
  evt.pointerId;
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
});

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
```

> [!NOTE]
> Xem ví dụ này chạy trực tiếp tại [Delegated ink trail](https://mabian-ms.github.io/delegated-ink-trail.html).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
