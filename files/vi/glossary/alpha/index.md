---
title: Alpha (alpha channel)
slug: Glossary/Alpha
page-type: glossary-definition
sidebar: glossarysidebar
---

**Kênh alpha** (alpha channel) chỉ định độ mờ đục của một ({{CSSxRef("&lt;color&gt;", "màu sắc")}}). Màu sắc được biểu diễn dưới dạng kỹ thuật số như một tập hợp các số, mỗi số đại diện cho cường độ hoặc mức độ của một thành phần màu sắc nhất định. Mỗi thành phần này được gọi là **kênh**. Trong một tệp hình ảnh thông thường, các kênh màu mô tả lượng đỏ, xanh lá và xanh lam được sử dụng để tạo nên màu sắc cuối cùng. Để biểu diễn một màu mà qua đó có thể nhìn thấy phần nào nền phía sau, một kênh thứ tư được thêm vào màu sắc: kênh alpha.

Ví dụ, màu `#8921F2` (còn được mô tả là `rgb(137 33 242)` hay `hsl(270 89% 54)`) là một sắc tím đẹp. Bên dưới bạn thấy một hộp nhỏ màu đó ở góc trên bên trái và một hộp _cùng_ màu nhưng có kênh alpha được đặt ở độ mờ đục 50% (hoặc 0.5), `#8921F280`, trong đó `80` là tương đương thập lục phân của 50%. Màu này cũng được mô tả là `rgb(137 33 242 / 50%)` hay `hsl(270 89% 54 / 50%)`. Hai hộp được vẽ phía trên một đoạn văn bản.

![Hình ảnh cho thấy hiệu ứng của kênh alpha trên màu sắc.](alpha-channel-example.png)

Như bạn có thể thấy, màu không có kênh alpha hoàn toàn che khuất văn bản nền, trong khi hộp có kênh alpha cho phép nhìn thấy văn bản qua màu tím phía sau.

## Xem thêm

- [Màu sắc CSS](/en-US/docs/Web/CSS/Guides/Colors)
- [Học: Giá trị và đơn vị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
- [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
- [Alpha compositing](https://en.wikipedia.org/wiki/Alpha_compositing) trên Wikipedia
- [Mô hình màu RGBA](https://en.wikipedia.org/wiki/RGBA_color_model) trên Wikipedia
- [Kênh (hình ảnh kỹ thuật số)](<https://en.wikipedia.org/wiki/Channel_(digital_image)>) trên Wikipedia
