---
title: Aspect ratio
slug: Glossary/Aspect_ratio
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tỷ lệ khung hình** (aspect ratio) là mối quan hệ tỷ lệ giữa chiều rộng và chiều cao của một phần tử hoặc {{glossary("viewport")}}. Nó được biểu diễn dưới dạng {{cssxref("ratio")}} của hai số.

Có tỷ lệ khung hình, dù là tỷ lệ khung hình cố hữu như ảnh và video hay được đặt từ bên ngoài, sẽ duy trì các tỷ lệ dự định của một phần tử. Bạn cũng có thể truy vấn tỷ lệ khung hình của một phần tử hoặc viewport, điều này hữu ích trong việc phát triển các thành phần và bố cục linh hoạt.

Trong CSS, kiểu dữ liệu {{cssxref("ratio")}} được viết dưới dạng `width / height` (ví dụ: `1 / 1` cho hình vuông, `16 / 9` cho màn hình rộng) hoặc một số duy nhất, trong đó số đó đại diện cho chiều rộng và chiều cao là `1`.

```css
.wideBox {
  aspect-ratio: 5 / 2;
}
.tallBox {
  aspect-ratio: 0.25;
}
```

Trong SVG, tỷ lệ khung hình được xác định bởi thuộc tính [`viewBox`](/en-US/docs/Web/SVG/Reference/Attribute/viewBox) có bốn giá trị. Hai giá trị đầu tiên là tọa độ X và Y nhỏ nhất mà SVG có thể có, và hai giá trị sau là chiều rộng và chiều cao thiết lập tỷ lệ khung hình của SVG.

```svg
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg"></svg>
```

Trong các API JavaScript, truy vấn tỷ lệ khung hình trả về một số dấu chấm động độ chính xác kép đại diện cho chiều rộng chia cho chiều cao. Bạn cũng có thể sử dụng JavaScript để đặt tỷ lệ khung hình của phần tử. Ví dụ, thiết lập ràng buộc tỷ lệ khung hình cho video 1920x1080 bằng cách sử dụng từ điển {{domxref("MediaStreamTrack")}} hoặc {{domxref("MediaTrackSettings")}} thuộc tính [`aspectRatio`](/en-US/docs/Web/API/MediaTrackSettings/aspectRatio) sẽ được tính là 16/9, hay 1920/1080, tức là `1.7777777778`:

```js
const constraints = {
  width: 1920,
  height: 1080,
  aspectRatio: 1.777777778,
};

myTrack.applyConstraints(constraints);
```

## Xem thêm

- Thuộc tính CSS {{cssxref("aspect-ratio")}}
- Hướng dẫn [Hiểu tỷ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- Mô-đun [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
- Các thuật ngữ liên quan:
  - {{glossary("intrinsic size")}}
- Giá trị thuộc tính CSS {{cssxref("min-content")}}, {{cssxref("max-content")}} và {{cssxref("fit-content")}}.
