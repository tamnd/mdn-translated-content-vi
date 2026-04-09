---
title: "CanvasRenderingContext2D: phương thức isContextLost()"
short-title: isContextLost()
slug: Web/API/CanvasRenderingContext2D/isContextLost
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.isContextLost
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.isContextLost()`** của API Canvas 2D trả về`true` nếu ngữ cảnh kết xuất bị mất (và chưa được đặt lại). Điều này có thể xảy ra do trình điều khiển bị treo, hết bộ nhớ, v.v.

Nếu tác nhân người dùng phát hiện thấy bộ nhớ đệm canvas bị mất, nó sẽ kích hoạt [`contextlost`event](/en-US/docs/Web/API/HTMLCanvasElement/contextlost_event) tại [`HTMLCanvasElement`](/en-US/docs/Web/API/HTMLCanvasElement) được liên kết. Nếu sự kiện này không bị hủy, nó sẽ cố gắng đặt lại bộ nhớ sao lưu về trạng thái mặc định (điều này tương đương với việc gọi {{domxref("CanvasRenderingContext2D.reset()")}}). Khi thành công, nó sẽ kích hoạt [`contextrestored` event](/en-US/docs/Web/API/HTMLCanvasElement/contextrestored_event), cho biết rằng bối cảnh đã sẵn sàng để khởi tạo lại và vẽ lại.

## Cú pháp

```js-nolint
isContextLost()
```

### Tham số

Không có.

### Giá trị trả về

`true`nếu ngữ cảnh hiển thị bị mất; `false` nếu không thì.

### Ví dụ

```js
const ctx = canvas.getContext("2d");

if (ctx.isContextLost()) {
  console.log("Context is lost");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- [`HTMLCanvasElement: contextlost` event](/en-US/docs/Web/API/HTMLCanvasElement/contextlost_event)
- [`HTMLCanvasElement: contextrestored` event](/en-US/docs/Web/API/HTMLCanvasElement/contextrestored_event)
