---
title: dynamic-range
slug: Web/CSS/Reference/At-rules/@media/dynamic-range
page-type: css-media-feature
browser-compat: css.at-rules.media.dynamic-range
sidebar: cssref
---

Tính năng media **`dynamic-range`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra sự kết hợp giữa độ sáng, tỷ lệ tương phản và độ sâu màu mà {{glossary("user agent")}} và thiết bị đầu ra hỗ trợ.

> [!NOTE]
> Một số thiết bị có khả năng dải động cao không phải lúc nào cũng "bật" và cần được kích hoạt (đôi khi theo cách lập trình, đôi khi do người dùng, đôi khi dựa trên nội dung). Tính năng media này không kiểm tra xem khả năng dải động có đang hoạt động hay không; nó chỉ kiểm tra xem thiết bị có khả năng hiển thị hình ảnh dải động cao hay không.

## Cú pháp

Tính năng `dynamic-range` được chỉ định dưới dạng một giá trị từ khóa được chọn trong danh sách bên dưới.

- `standard`
  - : Giá trị này khớp với bất kỳ thiết bị hiển thị nào và loại trừ các thiết bị thiếu khả năng hiển thị. Một tác nhân người dùng hoặc thiết bị đầu ra khớp với `high` cũng sẽ khớp với giá trị `standard`.

- `high`
  - : Giá trị này khớp với các tác nhân người dùng và thiết bị đầu ra hỗ trợ độ sáng đỉnh cao, tỷ lệ tương phản cao, và độ sâu màu lớn hơn 24 bit hoặc 8 bit trên mỗi thành phần màu của RGB. **Độ sáng đỉnh** đề cập đến độ sáng mà điểm sáng nhất trên thiết bị phát sáng, chẳng hạn như màn hình LCD, có thể tạo ra. Trong trường hợp thiết bị phản chiếu ánh sáng, chẳng hạn như giấy hoặc e-ink, độ sáng đỉnh đề cập đến điểm ít nhất hấp thụ ánh sáng. **Tỷ lệ tương phản** đề cập đến tỷ lệ giữa độ chói của màu sáng nhất và màu tối nhất mà hệ thống có thể tạo ra. Hiện tại, không có cách chính xác để đo độ sáng đỉnh và tỷ lệ tương phản, và việc xác định thế nào là độ sáng đỉnh cao và tỷ lệ tương phản cao phụ thuộc vào tác nhân người dùng.

## Ví dụ

```css
@media (dynamic-range: standard) {
  p {
    color: red;
  }
}

@media (dynamic-range: high) {
  p {
    color: green;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
