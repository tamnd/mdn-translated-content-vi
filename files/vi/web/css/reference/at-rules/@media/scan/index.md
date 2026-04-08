---
title: scan
slug: Web/CSS/Reference/At-rules/@media/scan
page-type: css-media-feature
browser-compat: css.at-rules.media.scan
sidebar: cssref
---

Đặc trưng media CSS **`scan`** được dùng để áp dụng các kiểu CSS dựa trên quy trình quét của thiết bị đầu ra.

## Cú pháp

Đặc trưng `scan` được chỉ định là một trong các giá trị từ khóa sau:

- `interlace`
  - : Thiết bị đầu ra sử dụng kết xuất "xen kẽ" (interlaced), trong đó các khung hình video luân phiên giữa việc chỉ định các dòng "chẵn" và chỉ các dòng "lẻ" trên màn hình.
- `progressive`
  - : Thiết bị đầu ra kết xuất nội dung lên màn hình mà không có xử lý đặc biệt nào.

## Mô tả

Hầu hết màn hình hiện đại (và tất cả màn hình máy tính) đều sử dụng kết xuất liên tục (progressive), hiển thị toàn bộ màn hình mà không có xử lý đặc biệt.

Kỹ thuật xen kẽ (interlacing) được sử dụng bởi màn hình CRT và một số TV plasma để tạo ra ảo giác về số khung hình mỗi giây (FPS) cao hơn trong khi giảm băng thông. Với kỹ thuật xen kẽ, các khung hình video luân phiên giữa việc kết xuất các dòng chẵn và các dòng lẻ trên màn hình, chỉ tải xuống và kết xuất một nửa màn hình cho mỗi khung hình, tận dụng khả năng làm mượt hình ảnh của não người để mô phỏng phát sóng FPS cao hơn với chi phí băng thông chỉ bằng một nửa.

Khi nhắm mục tiêu vào màn hình xen kẽ, hãy tránh chuyển động rất nhanh trên màn hình và đảm bảo các chi tiết động rộng hơn 1px để giảm hiện tượng nhấp nháy.

## Ví dụ

### HTML

```html
<p>This is a test.</p>
```

### CSS

```css
p {
  padding: 10px;
  border: solid;
}

@media screen and (scan: interlace) {
  p {
    background: #f4ae8a;
  }
}
@media screen and (scan: progressive) {
  p {
    text-decoration: underline;
  }
}
@media not screen and (scan: progressive) {
  p {
    border-style: dashed;
  }
}
@media not screen and (scan: interlaced) {
  p {
    color: purple;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Quy tắc [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media), được dùng để chỉ định biểu thức scan.
- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để hiểu khi nào và cách sử dụng media query.
