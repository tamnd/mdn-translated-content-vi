---
title: Bộ lọc SVG
slug: Web/SVG/Guides/SVG_filters
page-type: guide
sidebar: svgref
---

SVG cho phép chúng ta dùng các công cụ tương tự như ngôn ngữ mô tả bitmap, chẳng hạn như bóng đổ, hiệu ứng làm mờ hoặc thậm chí ghép kết quả của nhiều bộ lọc khác nhau. Với phần tử bộ lọc `<filter>`, bạn có thể thêm các hiệu ứng này và sau đó gắn chúng vào một đối tượng.

Bộ lọc hoạt động giống như các lớp. Khi tạo chúng, hãy thử áp dụng và kiểm tra hiệu ứng từng bước một.

Phần tử này có các thuộc tính khác nhau giúp chúng ta tạo vùng cắt. Giữa các thẻ filter, chúng ta có thể định nghĩa các _primitive_ cho phép triển khai hiệu ứng mong muốn. Một trong những primitive đó là [`<feGaussianBlur>`](/en-US/docs/Web/SVG/Reference/Element/feGaussianBlur). Từ khóa [`SourceAlpha`](https://drafts.csswg.org/filter-effects-1/#attr-valuedef-in-sourcealpha) xác định đầu vào cho primitive này, trong trường hợp này là đầu vào `in`. Lượng làm mờ được áp dụng được thiết lập bằng thuộc tính `stdDeviation`.

## Ví dụ bộ lọc SVG

```html
<defs>
  <filter id="drop-shadow">
    <feGaussianBlur in="SourceAlpha" stdDeviation="3" />
  </filter>
</defs>

<g id="ghost" filter="url(#drop-shadow)">
  <!--Ghost drawing in here-->
</g>
```

Ví dụ trên sẽ không tạo ra kết quả mong muốn. Thay vào đó, chúng ta cần thêm nhiều primitive bộ lọc hơn để tạo ra kết xuất đúng. Bằng cách thêm `feoffset` và `result`, lớp hiệu ứng được xác định.

Thuộc tính `<result>` là một tham chiếu có thể được dùng sau này. Nó khác hoàn toàn với XML id và chỉ có thể được tham chiếu bên trong chính `filter` đó. **`<feoffset>`** primitive có kết quả làm mờ từ Gaussian blur. **`<feMerge>`** primitive chứa các nút **`<feMergeNode>`** lấy đầu vào là kết quả offsetBlur, điều này cho phép nó xuất hiện bên dưới `sourceGraphic`.

## Triển khai thêm các primitive

```html
<defs>
  <filter id="drop-shadow">
    <feGaussianBlur in="SourceAlpha" stdDeviation="3" result="blur" />
    <feoffset in="blur" dx="4" dy="4" result="offsetBlur" />
    <feMerge>
      <feMergeNode in="offsetBlur" />
      <feMergeNode in="SourceGraphic" />
    </feMerge>
  </filter>
</defs>
```
