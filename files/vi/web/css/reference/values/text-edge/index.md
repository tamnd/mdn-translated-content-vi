---
title: <text-edge>
slug: Web/CSS/Reference/Values/text-edge
page-type: css-type
browser-compat: css.types.text-edge
sidebar: cssref
---

Kiểu dữ liệu {{glossary("enumerated")}} **`<text-edge>`** trong [CSS](/vi/docs/Web/CSS) định nghĩa các từ khóa chỉ định các số liệu phông chữ đại diện cho các vùng cụ thể trên cạnh bắt đầu khối và cạnh kết thúc khối của phông chữ. Mỗi từ khóa chỉ định vị trí của cạnh trên và/hoặc cạnh dưới của phông chữ.

Các giá trị `<text-edge>` được sử dụng trong thuộc tính {{cssxref("text-box-edge")}} để chỉ định lượng khoảng trống cần cắt bỏ từ cạnh bắt đầu khối và cạnh kết thúc khối của hộp chứa khối của phần tử văn bản.

## Cú pháp

Kiểu dữ liệu `<text-edge>` được tạo thành từ một hoặc hai từ khóa đại diện cho các vùng cụ thể trên cạnh bắt đầu khối (trên) và/hoặc cạnh kết thúc khối (dưới) của phông chữ:

- Khi chỉ định một giá trị, vị trí cạnh trên và cạnh dưới của phông chữ được chỉ định bằng cùng từ khóa đó.
- Khi chỉ định hai giá trị, giá trị đầu tiên chỉ định vị trí cạnh trên của phông chữ, và giá trị thứ hai chỉ định vị trí cạnh dưới của phông chữ.

### Giá trị

#### Giá trị từ khóa đơn

- `text`
  - : Cạnh trên và cạnh dưới của phông chữ là đường cơ sở text-over/text-under: bao gồm các nét lên và nét xuống của phông chữ nhưng loại trừ [half-leading](/vi/docs/Glossary/Leading) được đặt trên văn bản.

    > [!NOTE]
    > Lượng half-leading được bao gồm trên một phần tử văn bản có thể được điều chỉnh bằng thuộc tính {{cssxref("line-height")}}.

> [!NOTE]
> Các từ khóa `ideographic` và `ideographic-ink` nhằm chỉ định vị trí cạnh trên và dưới dành riêng cho [ký tự ngôn ngữ CJK](https://en.wikipedia.org/wiki/CJK_characters). Hiện tại, hành vi chính xác của chúng đang được tranh luận và không được bất kỳ trình duyệt nào hỗ trợ.

#### Giá trị hai từ khóa

- `alphabetic`
  - : Cạnh dưới của phông chữ là đường cơ sở alphabetic, là đáy của các chữ thường ngắn (ví dụ: "m", "n" và "o") hoặc chữ hoa.
- `cap`
  - : Cạnh trên của phông chữ là đường cơ sở cap-height, là đỉnh của các chữ hoa.
- `ex`
  - : Cạnh trên của phông chữ là đường cơ sở x-height, là đỉnh của các chữ thường ngắn.
- `text`
  - : Cạnh trên của phông chữ là đường cơ sở text-over (bao gồm các nét lên của phông chữ nhưng loại trừ half-leading của cạnh trên), hoặc cạnh dưới là đường cơ sở text-under (bao gồm các nét xuống của phông chữ nhưng loại trừ half-leading của cạnh dưới), tùy thuộc vào cạnh nào giá trị được đặt cho.

## Cú pháp chính thức

{{CSSSyntaxRaw(`<text-edge> = [ text | ideographic | ideographic-ink ] | [ text | ideographic | ideographic-ink | cap | ex ] [ text | ideographic | ideographic-ink | alphabetic ]`)}}

## Ví dụ

Xem [ví dụ `text-box-edge`](/vi/docs/Web/CSS/Reference/Properties/text-box-edge#examples)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-box")}}, {{cssxref("text-box-edge")}}, {{cssxref("text-box-trim")}}
- Mô-đun [CSS inline layout](/vi/docs/Web/CSS/Guides/Inline_layout)
