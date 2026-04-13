---
title: "KeyframeEffect: phương thức setKeyframes()"
short-title: setKeyframes()
slug: Web/API/KeyframeEffect/setKeyframes
page-type: web-api-instance-method
browser-compat: api.KeyframeEffect.setKeyframes
---

{{ APIRef("Web Animations") }}

Phương thức **`setKeyframes()`** của giao diện {{domxref("KeyframeEffect")}} thay thế các keyframe tạo nên `KeyframeEffect` bị ảnh hưởng bằng tập hợp keyframe mới.

## Cú pháp

```js-nolint
setKeyframes(keyframes)
```

### Tham số

- `keyframes`
  - : Đối tượng keyframe hoặc `null`. Nếu được đặt thành `null`, các keyframe được thay thế bằng một chuỗi keyframe rỗng.

    Thêm thông tin về [định dạng](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats#syntax) của đối tượng keyframe.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Ngoại lệ</th>
      <th scope="col">Giải thích</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>TypeError</code></td>
      <td>
        Một hoặc nhiều frame không có đúng loại đối tượng, các keyframe không
        <a href="https://w3c.github.io/web-animations/#loosely-sorted-by-offset"
          >được sắp xếp lỏng lẻo theo offset</a
        >, hoặc một keyframe tồn tại với offset nhỏ hơn 0 hoặc lớn hơn 1.
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Nếu các keyframe không thể được xử lý hoặc bị biến dạng, các keyframe của `KeyframeEffect` không bị sửa đổi.

## Ví dụ

```js
// passing an array of keyframe objects
existingKeyframeEffect.setKeyframes([
  { color: "blue" },
  { color: "green", left: "10px" },
]);

// passing an object with arrays for values
existingKeyframeEffect.setKeyframes({
  color: ["blue", "green"],
  left: ["0", "10px"],
});

// passing a single-member object
existingKeyframeEffect.setKeyframes({
  color: "blue",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giao diện KeyframeEffect](/en-US/docs/Web/API/KeyframeEffect)
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
