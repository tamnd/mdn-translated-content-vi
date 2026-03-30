---
title: BCP 47 language tag
slug: Glossary/BCP_47_language_tag
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thẻ ngôn ngữ BCP 47** (BCP 47 language tag) là một chuỗi ký tự xác định chính xác một ngôn ngữ của con người theo ngôn ngữ cơ bản, nhưng cũng tùy chọn hệ thống chữ viết và phương ngữ. Ví dụ, `en` chỉ định tiếng Anh, nhưng `en-GB` và `en-US` xác định chính xác hơn tiếng Anh Anh và tiếng Anh Mỹ tương ứng.

Thẻ ngôn ngữ BCP 47 được sử dụng ở bất kỳ đâu trên nền tảng web mà một tính năng được thiết kế để tạo ra các kết quả khác nhau tùy thuộc vào ngôn ngữ được chỉ định, cho phép hỗ trợ {{glossary("internationalization", "quốc tế hóa")}}.

Ví dụ bao gồm:

- Thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) trong HTML
- Phần tử HTML {{htmlelement("track")}}
- Đối tượng {{jsxref("Temporal")}}
- Thuộc tính {{domxref("CanvasRenderingContext2D.lang")}}
- [API Dịch thuật và Phát hiện ngôn ngữ](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs)

## Cú pháp BCP 47

Cú pháp đầy đủ của BCP 47 được quy định trong {{rfc("5646")}}. Nó có khả năng xác định các phương ngữ ngôn ngữ cực kỳ cụ thể, nhưng hầu hết các cách dùng đơn giản hơn nhiều.

Thẻ ngôn ngữ được tạo thành từ các _thẻ phụ_ được phân cách bởi dấu gạch ngang, trong đó mỗi thẻ phụ chỉ ra một thuộc tính nhất định của ngôn ngữ. Ba thẻ phụ phổ biến nhất là:

- Thẻ phụ ngôn ngữ
  - : Mã 2 hoặc 3 ký tự xác định ngôn ngữ cơ bản, thường được viết bằng chữ thường. Ví dụ, mã ngôn ngữ cho tiếng Anh là `en`, và mã cho Badeshi là `bdz`.
- Thẻ phụ chữ viết {{optional_inline}}
  - : Thẻ phụ này xác định hệ thống chữ viết được sử dụng cho ngôn ngữ và luôn dài 4 ký tự, với chữ cái đầu tiên được viết hoa. Ví dụ, tiếng Pháp bằng chữ Braille là `fr-Brai` và tiếng Nhật được viết bằng bảng chữ cái Katakana là `ja-Kana`.

    > [!NOTE]
    > Nếu ngôn ngữ được viết theo cách đặc trưng cao, như tiếng Anh bằng bảng chữ cái Latin, không cần sử dụng thẻ phụ này.

- Thẻ phụ vùng {{optional_inline}}
  - : Thẻ phụ này xác định một phương ngữ của ngôn ngữ cơ sở từ một địa điểm cụ thể và là hai chữ cái viết hoa khớp với mã quốc gia hoặc ba chữ số khớp với khu vực không phải quốc gia. Ví dụ, `es-ES` là tiếng Tây Ban Nha như được nói ở Tây Ban Nha, và `es-013` là tiếng Tây Ban Nha như được nói ở Trung Mỹ. "Tiếng Tây Ban Nha quốc tế" chỉ là `es`.

Thẻ phụ chữ viết đứng trước thẻ phụ vùng nếu cả hai đều có mặt — `ru-Cyrl-BY` là tiếng Nga, được viết bằng bảng chữ cái Cyrillic, như được nói ở Belarus.

## Xem thêm

- [Danh sách các thẻ phụ ngôn ngữ chính phổ biến](https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags)
- [RFC 5646: Tags for Identifying Languages](https://datatracker.ietf.org/doc/html/rfc5646): nơi các thẻ ngôn ngữ BCP 47 được quy định.
- [Chọn thẻ ngôn ngữ](https://www.w3.org/International/questions/qa-choosing-language-tags): Hướng dẫn W3C về chọn thẻ ngôn ngữ phù hợp.
- [Tra cứu thẻ phụ ngôn ngữ BCP 47](https://r12a.github.io/app-subtags/): tra cứu mã thẻ phụ cho một ngôn ngữ.
