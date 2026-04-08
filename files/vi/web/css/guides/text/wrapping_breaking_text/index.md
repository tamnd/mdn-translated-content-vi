---
title: Wrapping and breaking text
slug: Web/CSS/Guides/Text/Wrapping_breaking_text
page-type: guide
sidebar: cssref
---

Hướng dẫn này giải thích các cách khác nhau để quản lý văn bản tràn trong CSS.

## Văn bản tràn là gì?

Trong CSS, nếu bạn có một chuỗi không thể ngắt như một từ rất dài, theo mặc định nó sẽ tràn ra ngoài bất kỳ container nào quá nhỏ cho nó theo chiều inline. Chúng ta có thể thấy điều này xảy ra trong ví dụ dưới đây: từ dài đang mở rộng vượt qua ranh giới của box chứa nó.

```html live-sample___inline-overflow
<div class="box">
  Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___inline-overflow
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: 150px;
}
```

{{EmbedLiveSample("inline-overflow")}}

CSS sẽ hiển thị overflow theo cách này, vì làm điều gì đó khác có thể gây mất dữ liệu. Trong CSS, mất dữ liệu có nghĩa là một phần nội dung của bạn biến mất. Vì vậy giá trị khởi đầu của {{cssxref("overflow")}} là `visible`, và chúng ta có thể thấy văn bản tràn. Thông thường tốt hơn là có thể nhìn thấy overflow, ngay cả khi nó lộn xộn. Nếu mọi thứ biến mất hoặc bị cắt như sẽ xảy ra nếu `overflow` được đặt thành `hidden`, bạn có thể không nhận ra nó khi xem trước trang của mình. Overflow lộn xộn ít nhất có thể nhận thấy, và trong trường hợp xấu nhất, khách truy cập của bạn sẽ có thể nhìn thấy và đọc nội dung ngay cả khi nó trông hơi kỳ lạ.

Trong ví dụ tiếp theo này, bạn có thể thấy điều gì xảy ra nếu `overflow` được đặt thành `hidden`.

```html live-sample___inline-overflow-hidden
<div class="box">
  Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___inline-overflow-hidden
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: 150px;
  overflow: hidden;
}
```

{{EmbedLiveSample("inline-overflow-hidden")}}

## Tìm kích thước min-content

Để tìm kích thước tối thiểu của box sẽ chứa nội dung của nó mà không bị tràn, hãy đặt thuộc tính {{cssxref("width")}} hoặc {{cssxref("inline-size")}} của box thành {{cssxref("min-content")}}.

```html live-sample___min-content
<div class="box">
  Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___min-content
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: min-content;
}
```

{{EmbedLiveSample("min-content")}}

Sử dụng `min-content` do đó là một khả năng cho các box bị tràn. Nếu có thể cho phép box phát triển đến kích thước tối thiểu cần thiết cho nội dung, nhưng không lớn hơn, sử dụng từ khóa này sẽ cung cấp cho bạn kích thước đó.

## Ngắt từ dài

Nếu box cần có kích thước cố định, hoặc bạn muốn đảm bảo rằng các từ dài không thể tràn ra, thì thuộc tính {{cssxref("overflow-wrap")}} có thể giúp ích. Thuộc tính này sẽ ngắt một từ khi nó quá dài để vừa trên một dòng.

```html live-sample___overflow-wrap
<div class="box">
  Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___overflow-wrap
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: 150px;
  overflow-wrap: break-word;
}
```

{{EmbedLiveSample("overflow-wrap")}}

> [!NOTE]
> Thuộc tính `overflow-wrap` hoạt động theo cùng cách như thuộc tính không chuẩn `word-wrap`. Thuộc tính `word-wrap` hiện được các trình duyệt coi là bí danh của thuộc tính chuẩn.

Một thuộc tính thay thế để thử là {{cssxref("word-break")}}. Thuộc tính này sẽ ngắt từ tại điểm nó tràn ra. Nó sẽ gây ra ngắt ngay cả khi đặt từ vào dòng mới sẽ cho phép nó hiển thị mà không cần ngắt.

Trong ví dụ tiếp theo này, bạn có thể so sánh sự khác biệt giữa hai thuộc tính trên cùng một chuỗi văn bản.

```html live-sample___word-break
<div class="box box1">A Very LongWordThatHasNoBreakingPossibilities</div>

<div class="box box2">A Very LongWordThatHasNoBreakingPossibilities</div>
```

```css live-sample___word-break
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: 30ch;
  margin-block-end: 1em;
}
.box1 {
  word-break: break-all;
}

.box2 {
  overflow-wrap: break-word;
}
```

{{EmbedLiveSample("word-break", "", "210px")}}

Điều này có thể hữu ích nếu bạn muốn ngăn một khoảng cách lớn xuất hiện nếu chỉ có đủ không gian cho chuỗi. Hoặc, khi có một phần tử khác mà bạn không muốn ngắt xảy ra ngay sau đó.

Trong ví dụ dưới đây có một checkbox và nhãn. Giả sử bạn muốn nhãn ngắt nếu nó quá dài cho box. Tuy nhiên, bạn không muốn nó ngắt ngay sau checkbox.

```html live-sample___word-break-checkbox
<div class="field">
  <input id="one" type="checkbox" /><label for="one">
    LongWordThatHasNoBreakingPossibilities
  </label>
</div>

<div class="field field-br">
  <input id="two" type="checkbox" /><label for="two">
    LongWordThatHasNoBreakingPossibilities
  </label>
</div>
```

```css live-sample___word-break-checkbox
.field {
  inline-size: 150px;
  border: 1px solid #cccccc;
  margin-block-end: 1em;
  padding: 10px;
}

.field-br {
  word-break: break-all;
}
```

{{EmbedLiveSample("word-break-checkbox", "", "210px")}}

## Thêm dấu gạch nối

Để thêm dấu gạch nối khi các từ bị ngắt, hãy sử dụng thuộc tính CSS {{cssxref("hyphens")}}. Sử dụng giá trị `auto`, trình duyệt được tự do tự động ngắt các từ tại các điểm gạch nối phù hợp, theo bất kỳ quy tắc nào nó chọn. Để có một số kiểm soát quá trình, hãy sử dụng giá trị `manual`, sau đó chèn một ký tự ngắt cứng (U+2010) hoặc ngắt mềm (U+00AD) vào chuỗi. Ký tự ngắt cứng có thể được thêm bằng `‐` hoặc `&#x2010;`, và ký tự ngắt mềm có thể được thêm bằng mã HTML `&shy;`, `&#173;`, hoặc `&#xad;`. Ký tự ngắt cứng sẽ luôn ngắt, ngay cả khi không cần thiết. Ký tự ngắt mềm chỉ ngắt khi cần ngắt.

```html live-sample___hyphens
<div class="box">
  Llanfair&shy;pwllgwyngyll&shy;gogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___hyphens
.box {
  inline-size: 150px;
  overflow-wrap: break-word;
  hyphens: manual;
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
}
```

{{EmbedLiveSample("hyphens")}}

Bạn cũng có thể sử dụng thuộc tính {{cssxref("hyphenate-character")}} để sử dụng chuỗi bạn chọn thay vì ký tự gạch nối mặc định ở cuối dòng (trước ngắt dòng gạch nối) cho ngôn ngữ. Giá trị `auto` chọn giá trị đúng để đánh dấu một ngắt dòng giữa từ theo các quy ước đánh máy của ngôn ngữ nội dung hiện tại.

CSS cung cấp thêm kiểm soát gạch nối: thuộc tính {{cssxref("hyphenate-limit-chars")}} có thể được sử dụng để đặt độ dài từ tối thiểu cho phép gạch nối cũng như số ký tự tối thiểu trước và sau dấu gạch nối.

## Phần tử `<wbr>`

Nếu bạn biết nơi bạn muốn một chuỗi dài ngắt, thì cũng có thể chèn phần tử HTML {{HTMLElement("wbr")}}. Điều này có thể hữu ích trong các trường hợp như hiển thị URL dài trên một trang. Bạn sau đó có thể thêm thuộc tính để ngắt chuỗi ở những vị trí hợp lý sẽ làm cho nó dễ đọc hơn.

Trong ví dụ dưới đây, văn bản ngắt tại vị trí của {{HTMLElement("wbr")}}.

```html live-sample___wbr
<div class="box">
  Llanfair<wbr />pwllgwyngyll<wbr />gogerychwyrndrobwllllantysiliogogogoch
</div>
```

```css live-sample___wbr
.box {
  border: 4px solid #f76707;
  border-radius: 5px;
  padding: 10px;
  inline-size: 150px;
}
```

{{EmbedLiveSample("wbr")}}

## Xem thêm

- Phần tử HTML {{HTMLElement("wbr")}}
- Thuộc tính CSS {{cssxref("word-break")}}
- Thuộc tính CSS {{cssxref("overflow-wrap")}}
- Thuộc tính CSS {{cssxref("white-space")}}
- Thuộc tính CSS {{cssxref("text-wrap")}}
- Thuộc tính CSS {{cssxref("hyphens")}}
- Thuộc tính CSS {{cssxref("hyphenate-character")}}
- Thuộc tính CSS {{cssxref("hyphenate-limit-chars")}}
- [Overflow and Data Loss in CSS](https://www.smashingmagazine.com/2019/09/overflow-data-loss-css/)
