---
title: "Animation: thuộc tính finished"
short-title: finished
slug: Web/API/Animation/finished
page-type: web-api-instance-property
browser-compat: api.Animation.finished
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`Animation.finished`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một {{jsxref("Promise")}} sẽ được giải quyết khi hoạt ảnh phát xong.

> [!NOTE]
> Mỗi khi hoạt ảnh rời khỏi trạng thái phát `finished` (tức là khi nó bắt đầu phát lại), một `Promise` mới sẽ được tạo cho thuộc tính này. `Promise` mới sẽ được giải quyết khi chuỗi hoạt ảnh mới hoàn tất.

## Giá trị

Một đối tượng {{jsxref("Promise")}} sẽ được giải quyết khi hoạt ảnh đã chạy xong.

## Ví dụ

Đoạn mã sau đợi cho đến khi tất cả hoạt ảnh đang chạy trên phần tử `elem` hoàn tất, rồi xóa phần tử đó khỏi cây DOM:

```js
Promise.all(elem.getAnimations().map((animation) => animation.finished)).then(
  () => elem.remove(),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyframeEffect")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
