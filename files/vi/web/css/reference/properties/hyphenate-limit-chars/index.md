---
title: hyphenate-limit-chars
slug: Web/CSS/Reference/Properties/hyphenate-limit-chars
page-type: css-property
browser-compat: css.properties.hyphenate-limit-chars
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`hyphenate-limit-chars`** xác định độ dài từ tối thiểu để cho phép gạch nối cũng như số ký tự tối thiểu trước và sau gạch nối.

Thuộc tính này cung cấp khả năng kiểm soát chi tiết đối với việc gạch nối trong văn bản. Khả năng kiểm soát này giúp tránh các trường hợp gạch nối gây khó đọc và đặt ngắt gạch nối phù hợp cho các ngôn ngữ khác nhau, từ đó cải thiện chất lượng trình bày.

## Cú pháp

```css
/* Giá trị số */
hyphenate-limit-chars: 10 4 4;
hyphenate-limit-chars: 10 4;
hyphenate-limit-chars: 10;

/* Giá trị từ khóa */
hyphenate-limit-chars: auto auto auto;
hyphenate-limit-chars: auto auto;
hyphenate-limit-chars: auto;

/* Kết hợp giá trị số và từ khóa */
hyphenate-limit-chars: 10 auto 4;
hyphenate-limit-chars: 10 auto;
hyphenate-limit-chars: auto 3;

/* Giá trị toàn cục */
hyphenate-limit-chars: inherit;
hyphenate-limit-chars: initial;
hyphenate-limit-chars: revert;
hyphenate-limit-chars: revert-layer;
hyphenate-limit-chars: unset;
```

Thuộc tính `hyphenate-limit-chars` nhận 1–3 giá trị có thể là số hoặc `auto`, như giải thích bên dưới.

### Giá trị

- `<number> <number> <number>`
  - : Giá trị đầu tiên là độ dài từ tối thiểu trước khi từ được gạch nối. Giá trị thứ hai là số ký tự tối thiểu trước gạch nối. Giá trị thứ ba là số ký tự tối thiểu sau gạch nối.
- `<number> <number>`
  - : Giá trị đầu tiên là độ dài từ tối thiểu trước khi từ được gạch nối. Giá trị thứ hai là số ký tự tối thiểu trước gạch nối. Số ký tự tối thiểu sau gạch nối sẽ bằng giá trị thứ hai.
- `<number>`
  - : Giá trị là độ dài từ tối thiểu trước khi từ được gạch nối. Số ký tự tối thiểu trước và sau gạch nối sẽ được đặt thành `auto`.

Nếu `auto` được đặt cho bất kỳ giá trị nào, tác nhân người dùng sẽ chọn một giá trị phù hợp cho bố cục hiện tại. Trừ khi tác nhân người dùng có thể tính toán một giá trị tốt hơn, các giá trị mặc định sau sẽ được dùng:

- Độ dài từ tối thiểu để cho phép gạch nối: 5
- Số ký tự tối thiểu trước gạch nối: 2
- Số ký tự tối thiểu sau gạch nối: 2

Lưu ý rằng nếu một từ quá ngắn để đáp ứng các ràng buộc đã cho, nó sẽ không bị gạch nối. Ví dụ, với giá trị như `hyphenate-limit-chars: auto 3 4`, các từ ngắn hơn 7 ký tự sẽ không bao giờ bị gạch nối, vì không thể có 3 ký tự trước gạch nối và 4 ký tự sau nó.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt giới hạn gạch nối

Trong ví dụ này, có bốn hộp chứa cùng một đoạn văn bản. Để so sánh, hộp đầu tiên hiển thị việc gạch nối mặc định mà trình duyệt áp dụng. Ba hộp tiếp theo minh họa kết quả của việc hạn chế hành vi mặc định của trình duyệt bằng các giá trị `hyphenate-limit-chars` khác nhau.

#### HTML

```html
<div class="container">
  <p id="ex1">juxtaposition and acknowledgement</p>
  <p id="ex2">juxtaposition and acknowledgement</p>
  <p id="ex3">juxtaposition and acknowledgement</p>
  <p id="ex4">juxtaposition and acknowledgement</p>
</div>
```

#### CSS

```css
.container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
}

p {
  margin: 1rem;
  width: 120px;
  border: 2px dashed #999999;
  font-size: 1.5rem;
  hyphens: auto;
}

#ex2 {
  hyphenate-limit-chars: 14;
}

#ex3 {
  hyphenate-limit-chars: 5 9 2;
}

#ex4 {
  hyphenate-limit-chars: 5 2 7;
}
```

#### Kết quả

{{EmbedLiveSample("Setting hyphenation limits", "", 200)}}

Trong hộp đầu tiên, chúng ta không đặt `hyphenate-limit-chars`, để trình duyệt áp dụng thuật toán mặc định. Theo mặc định, trình duyệt sử dụng giá trị `5 2 2` trừ khi tìm được giá trị tốt hơn.

Trong hộp thứ hai, chúng ta ngăn trình duyệt gạch nối từ trừ khi từ đó có ít nhất 14 ký tự bằng cách đặt `hyphenate-limit-chars: 14`. Kết quả là "juxtaposition" không bị gạch nối trong hộp thứ hai vì nó chỉ có 13 ký tự.

<!-- cSpell:ignore acknowled gement acknowl edgement ment -->

Trong hộp thứ ba, chúng ta buộc trình duyệt phải có ít nhất 9 ký tự trước gạch nối bằng cách đặt `hyphenate-limit-chars: 5 9 2`. Hiệu quả là "acknowledgement" giờ bị gạch nối thành "acknowledge-ment" thay vì phiên bản mặc định "acknowl-edgement" như ở hộp đầu tiên.

Lưu ý rằng trình duyệt không cần phải có chính xác 9 ký tự trước gạch nối: miễn là các ràng buộc trong `hyphenate-limit-chars` được thỏa mãn, trình duyệt có thể ngắt từ tại vị trí mà nó cho là tốt nhất. Vì vậy trong trường hợp này, nó chọn "acknowledge-ment" thay vì "acknowled-gement" khó đọc hơn.

<!-- cSpell:ignore juxtaposi tion -->

Trong hộp thứ tư, chúng ta yêu cầu trình duyệt có ít nhất 7 ký tự sau gạch nối bằng cách đặt `hyphenate-limit-chars: 5 2 7`. Hiệu quả là "juxtaposition" bị gạch nối thành "juxta-position" thay vì mặc định "juxtaposi-tion".

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("hyphens")}}
- [Mô-đun CSS Text](/en-US/docs/Web/CSS/Guides/Text)
