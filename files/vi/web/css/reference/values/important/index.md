---
title: "!important"
slug: Web/CSS/Reference/Values/important
page-type: css-keyword
sidebar: cssref
---

Dấu phân cách `!` theo sau bởi từ khóa `important` đánh dấu khai báo đó là quan trọng. Cờ `!important` thay đổi các quy tắc chọn khai báo bên trong [cascade](/vi/docs/Web/CSS/Guides/Cascade/Introduction). Một khai báo không _quan trọng_ được gọi là _bình thường_.

Để đánh dấu một khai báo là quan trọng, thêm _cờ important_ (`!important`) sau giá trị trong khai báo. Mặc dù khoảng trắng được phép giữa dấu phân cách và từ khóa, cờ này thường được viết là `!important` không có khoảng trắng.

```css-nolint
selector {
  property: value; /* khai báo bình thường */
  property: value !important; /* khai báo quan trọng (được ưu tiên) */
  property: value ! important; /* khai báo quan trọng (không được ưu tiên) */
}
```

`!important` xuất hiện sau giá trị của cặp khai báo thuộc tính-giá trị, có thể có không hoặc nhiều khoảng trắng trước. Cờ important phải là token cuối cùng trong khai báo. Nói cách khác, có thể có khoảng trắng và chú thích giữa cờ và dấu chấm phẩy kết thúc khai báo, nhưng không có gì khác.

## Ảnh hưởng đến cascade

Đối với các khai báo quan trọng, [thứ tự nguồn gốc và lớp cascade](/vi/docs/Web/CSS/Guides/Cascade/Introduction) bị đảo ngược. Khi không có cờ important, các khai báo trong style sheet của tác giả ghi đè các khai báo trong style sheet của người dùng, vốn ghi đè các khai báo trong style sheet mặc định của user-agent.

Khi một khai báo là quan trọng, thứ tự ưu tiên bị đảo ngược. Các khai báo được đánh dấu là quan trọng trong style sheet của user-agent ghi đè tất cả các khai báo quan trọng trong style sheet của người dùng. Tương tự, tất cả các khai báo quan trọng trong style sheet của người dùng ghi đè tất cả các khai báo quan trọng trong style sheet của tác giả. Cuối cùng, tất cả các khai báo quan trọng được ưu tiên hơn tất cả các animation.

> [!NOTE]
> Tất cả các khai báo quan trọng được ưu tiên hơn tất cả các animation. `!important` không hợp lệ trong các khai báo [@keyframes animation](/vi/docs/Web/CSS/Reference/At-rules/@keyframes).

Việc đảo ngược thứ tự ưu tiên cho các khai báo quan trọng đảm bảo người dùng có nhu cầu đặc biệt, như bảng màu tùy chỉnh hoặc font chữ lớn, có thể ghi đè các style của tác giả khi cần bằng cách đánh dấu một số khai báo trong style sheet của họ là quan trọng. Điều này cũng đảm bảo các tiện ích mở rộng độc hại không thể ghi đè các style user-agent quan trọng, điều có thể làm hỏng chức năng hoặc ảnh hưởng tiêu cực đến bảo mật.

Có điều gì có ưu tiên cao hơn các khai báo quan trọng không? Có, đó là [transitions](/vi/docs/Web/CSS/Guides/Transitions). CSS transitions là cách kiểm soát tốc độ thay đổi thuộc tính từ giá trị này sang giá trị khác. Trong khi chuyển tiếp từ giá trị này sang giá trị khác, một thuộc tính sẽ không khớp với một khai báo quan trọng cụ thể.

```css
a {
  color: red !important;
  background-color: yellow;
  transition: all 2s linear;
}
a:hover {
  color: blue !important;
  background-color: orange !important;
}
```

Trong ví dụ này, các thuộc tính `color` và `background-color` sẽ chuyển tiếp sang trạng thái hover trong hai giây. Mặc dù trạng thái mặc định là các khai báo bình thường và trạng thái hover là các khai báo `!important`, quá trình chuyển tiếp vẫn xảy ra.

### Các lớp cascade

Trong mỗi trong ba nguồn gốc cho style sheet — tác giả, người dùng, và user-agent — các khai báo bình thường trong các style không được phân lớp ghi đè các khai báo style phân lớp, với khai báo được khai báo cuối cùng có ưu tiên hơn các lớp được khai báo trước nó. Các khai báo quan trọng đảo ngược thứ tự ưu tiên: các khai báo quan trọng trong lớp đầu tiên được ưu tiên hơn các khai báo quan trọng trong lớp tiếp theo, v.v. Ngoài ra, tất cả các khai báo quan trọng được ưu tiên hơn các khai báo quan trọng được thực hiện bên ngoài bất kỳ lớp nào.

### Inline styles

Inline style là các style được định nghĩa bằng thuộc tính [`style`](/vi/docs/Web/HTML/Reference/Global_attributes/style). Chúng cũng có thể là bình thường hoặc quan trọng. Inline _normal_ style được ưu tiên hơn tất cả các khai báo _normal_, bất kể nguồn gốc. Inline _important_ style được ưu tiên hơn tất cả các inline style _important_ khác của tác giả, bất kể lớp, nhưng các important style từ style sheet của người dùng hoặc user-agent và transitions sẽ ghi đè chúng.

### !important và specificity

Mặc dù `!important` không phải là một phần của việc xác định specificity, nó có liên quan. Các khai báo quan trọng ghi đè tất cả các khai báo khác từ cùng [nguồn gốc và lớp cascade](/vi/docs/Web/CSS/Guides/Cascade/Introduction).

```css
#myElement#myElement#myElement .myClass.myClass p:hover {
  color: blue;
}

p {
  color: red !important;
}
```

Ví dụ này hiển thị một trường hợp chỉ định bộ chọn quá mức. Bất kể [specificity](/vi/docs/Web/CSS/Guides/Cascade/Specificity) của bộ chọn khớp với một khai báo bình thường cao đến đâu, một khai báo quan trọng từ cùng nguồn và lớp cascade sẽ luôn được ưu tiên. Trong trường hợp này, đoạn văn sẽ luôn có màu đỏ.

Khi hai khai báo quan trọng từ cùng nguồn gốc và lớp áp dụng cho cùng một phần tử, trình duyệt chọn và sử dụng khai báo có specificity cao nhất.

```css
#myElement p {
  color: green !important;
}

p {
  color: purple !important;
}
```

Trong trường hợp này, specificity của bộ chọn quan trọng. Chỉ khi các bộ chọn có cùng specificity thì thứ tự nguồn mới quan trọng.

## Ảnh hưởng đến thuộc tính viết tắt

Khai báo một thuộc tính viết tắt với `!important` đặt tất cả các thuộc tính con là quan trọng. Hai khối style bộ chọn sau đây tương đương nhau:

```css
p {
  background: blue !important;
}

p {
  background-image: none !important;
  background-position: 0 0 !important;
  background-size: auto auto !important;
  background-repeat: repeat !important;
  background-origin: padding-box !important;
  background-clip: border-box !important;
  background-attachment: scroll !important;
  background-color: blue !important;
}
```

Ví dụ này cho thấy một trong nhiều lý do tại sao việc tránh sử dụng cờ important thường được khuyến nghị.

## Ảnh hưởng đến thuộc tính tùy chỉnh

Khi cờ `!important` được thêm vào khai báo giá trị thuộc tính tùy chỉnh, nó làm cho việc gán giá trị trở nên quan trọng. Cờ `!important` sau đó bị loại bỏ khỏi giá trị thuộc tính tùy chỉnh. Cờ `!important` không được truyền như một phần của giá trị thuộc tính tùy chỉnh cho hàm [`var()`](/vi/docs/Web/CSS/Reference/Values/var).

```css
:root {
  --my-color: red !important;
  --my-color: blue;
}
p {
  color: var(--my-color);
}
blockquote {
  color: var(--my-color);
  color: purple;
}
```

```html hidden
<p>This is a paragraph</p>
<blockquote>This is a blockquote</blockquote>
```

Trong ví dụ này, đoạn văn sẽ có màu đỏ, không phải màu xanh, vì việc gán giá trị thuộc tính tùy chỉnh là quan trọng. Blockquote sẽ có màu tím, vì khai báo bình thường màu tím xuất hiện sau khai báo bình thường màu đỏ.

{{ EmbedLiveSample('Impact_on_custom_properties', '500', '250') }}

## Thực hành tốt nhất

Tránh sử dụng `!important` để ghi đè specificity. Khi cố tình tạo các khai báo quan trọng cho yêu cầu UI, hãy thêm chú thích vào code CSS để giải thích cho người bảo trì tại sao họ không nên ghi đè tính năng đó.

Ngay cả khi làm việc để ghi đè các style có specificity cao không thuộc quyền kiểm soát của bạn, chẳng hạn như các style trong plugin bên thứ 3 được khai báo với [id selector](/vi/docs/Web/CSS/Reference/Selectors/ID_selectors), bạn không cần sử dụng `!important`. Thay vào đó, hãy xem xét việc nhập script stylesheet bên thứ 3 vào một [named or anonymous layer](/vi/docs/Web/CSS/Reference/At-rules/@layer) như lớp cascade đầu tiên của bạn, thay vì sử dụng `!important`. Miễn là các style bên ngoài không bao gồm các khai báo quan trọng, các style của bạn sẽ được ưu tiên hơn các style của widget, bất kể specificity.

Nếu bạn cần ghi đè một stylesheet bên ngoài chứa các khai báo quan trọng, hãy tạo một lớp cascade chứa các ghi đè cần thiết và khai báo lớp đó trước.

### Vấn đề về khả năng tiếp cận

Các important style từ style sheet của người dùng được ưu tiên hơn các khai báo quan trọng trong style sheet của tác giả, nghĩa là thêm cờ `!important` vào style của một trang web sẽ không ngăn người dùng cá nhân có yêu cầu đặc biệt, như font chữ lớn, ghi đè style của bạn bằng cách thêm các important style vào style sheet của người dùng của họ.

## Khả năng tương thích trình duyệt

Tính năng này được hỗ trợ trong tất cả các trình duyệt.

## Xem thêm

- [CSS Specificity](/vi/docs/Web/CSS/Guides/Cascade/Specificity)
- [CSS Cascade](/vi/docs/Web/CSS/Guides/Cascade/Introduction)
