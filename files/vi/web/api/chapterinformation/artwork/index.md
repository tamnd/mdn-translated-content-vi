---
title: "ChapterInformation: thuộc tính artwork"
short-title: artwork
slug: Web/API/ChapterInformation/artwork
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ChapterInformation.artwork
---

{{APIRef("Media Session API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`artwork`** của giao diện
{{domxref("ChapterInformation")}} trả về một {{jsxref("Array")}} các đối tượng biểu diễn các hình ảnh liên kết với chương.

## Giá trị

Một {{jsxref("Array")}} các đối tượng. Mỗi đối tượng chứa các thuộc tính sau:

- `src`
  - : Một chuỗi biểu diễn URL mà từ đó tác nhân người dùng lấy dữ liệu của hình ảnh.
- `sizes`
  - : Một chuỗi biểu diễn một hoặc nhiều kích thước của tài nguyên. Giá trị của nó có thể là từ khóa `any` (biểu diễn một định dạng vector có thể co giãn như SVG), hoặc một danh sách các token được phân tách bằng dấu cách theo định dạng `<chiều rộng tính bằng pixel>x<chiều cao tính bằng pixel>` hoặc `<chiều rộng tính bằng pixel>X<chiều cao tính bằng pixel>`. Nếu có nhiều kích thước được cung cấp, tác nhân người dùng có thể tải kích thước phù hợp nhất với ngữ cảnh hiện tại, miễn là các kích thước đó có sẵn trong tài nguyên được liên kết.
- `type`
  - : Một chuỗi biểu diễn gợi ý về {{Glossary("MIME type")}} cho phép tác nhân người dùng bỏ qua những kiểu hình ảnh mà nó không hỗ trợ. Tuy nhiên, tác nhân người dùng vẫn có thể dùng cơ chế sniffing kiểu MIME sau khi tải hình ảnh xuống để xác định kiểu của nó.

## Ví dụ

Xem trang {{domxref("ChapterInformation")}} chính để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ChapterInformation")}}
