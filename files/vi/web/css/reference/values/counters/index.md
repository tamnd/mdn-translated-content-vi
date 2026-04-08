---
title: counters()
slug: Web/CSS/Reference/Values/counters
page-type: css-function
browser-compat: css.types.counters
sidebar: cssref
---

Hàm **`counters()`** trong [CSS](/vi/docs/Web/CSS) cho phép kết hợp các marker khi lồng bộ đếm. Hàm trả về một chuỗi nối các giá trị hiện tại của các bộ đếm được đặt tên và lồng nhau, nếu có, với chuỗi được cung cấp. Tham số thứ ba tùy chọn cho phép định nghĩa kiểu danh sách.

Hàm `counters()` thường được sử dụng trong [pseudo-element](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements) thông qua thuộc tính {{cssxref("content")}}, nhưng về lý thuyết, nó có thể được sử dụng ở bất kỳ đâu mà giá trị {{cssxref("string")}} được hỗ trợ.

Hàm `counters()` có hai dạng: `counters(<name>, <string>)` và `counters(<name>, <string>, <style>)`. Văn bản được tạo ra là giá trị của tất cả các bộ đếm có `<name>` đã cho, được sắp xếp từ ngoài cùng đến trong cùng, được phân tách bằng `<string>` được chỉ định. Các bộ đếm được hiển thị theo `<style>` được chỉ định, mặc định là `decimal` nếu không có `<style>` nào được chỉ định.

{{InteractiveExample("CSS Demo: counters()", "tabbed-standard")}}

```css interactive-example
ol {
  counter-reset: index;
  list-style-type: none;
}

li::before {
  counter-increment: index;
  content: counters(index, ".", decimal) " ";
}
```

```html interactive-example
<ol>
  <li>Mars</li>
  <li>
    Saturn
    <ol>
      <li>Mimas</li>
      <li>Enceladus</li>
      <li>
        <ol>
          <li>Voyager</li>
          <li>Cassini</li>
        </ol>
      </li>
      <li>Tethys</li>
    </ol>
  </li>
  <li>
    Uranus
    <ol>
      <li>Titania</li>
    </ol>
  </li>
</ol>
```

## Cú pháp

```css
/* Sử dụng cơ bản - kiểu mặc định là decimal */
counters(counter-name, '.');

/* thay đổi hiển thị bộ đếm */
counters(counter-name, '-', upper-roman)
```

Bản thân [bộ đếm](/vi/docs/Web/CSS/Guides/Counter_styles/Using_counters) không có hiệu ứng hiển thị. Hàm `counters()` (và hàm {{cssxref("counter()")}}) là thứ làm cho nó hữu ích bằng cách trả về nội dung do nhà phát triển định nghĩa.

### Giá trị

Hàm `counters()` chấp nhận hai hoặc ba tham số. Tham số đầu tiên là `<counter-name>`. Tham số thứ hai là `<string>` nối. Tham số thứ ba tùy chọn là `<counter-style>`.

- `<counter-name>`
  - : Một {{cssxref("&lt;custom-ident&gt;")}} xác định các bộ đếm, là cùng tên phân biệt chữ hoa chữ thường được sử dụng cho các thuộc tính {{cssxref("counter-reset")}} và {{cssxref("counter-increment")}}. Tên không thể bắt đầu bằng hai dấu gạch ngang và không thể là `none`, `unset`, `initial`, hoặc `inherit`. Ngoài ra, đối với các bộ đếm nội tuyến dùng một lần, hàm {{cssxref("symbols")}} có thể được sử dụng thay vì bộ đếm được đặt tên trong [các trình duyệt hỗ trợ `symbols()`](/vi/docs/Web/CSS/Reference/Values/symbols#browser_compatibility).
- {{cssxref("&lt;string&gt;")}}
  - : Bất kỳ số lượng ký tự văn bản nào. Các ký tự không phải Latin phải được mã hóa bằng các chuỗi thoát Unicode của chúng: ví dụ, `\000A9` đại diện cho ký hiệu bản quyền.
- `<counter-style>`
  - : Tên kiểu bộ đếm hoặc hàm [`symbols()`](/vi/docs/Web/CSS/Reference/Values/symbols). Tên kiểu bộ đếm có thể là kiểu được định nghĩa trước như numeric, alphabetic, hoặc symbolic, kiểu được định nghĩa trước phức tạp như East Asian hoặc Ethiopic, hoặc [kiểu bộ đếm được định nghĩa trước](/vi/docs/Web/CSS/Guides/Counter_styles) khác. Nếu bỏ qua, kiểu bộ đếm mặc định là decimal.

Giá trị trả về là một chuỗi chứa tất cả các giá trị của tất cả các bộ đếm trong tập hợp bộ đếm CSS của phần tử có tên `<counter-name>` theo kiểu bộ đếm được định nghĩa bởi `<counter-style>` (hoặc decimal, nếu bỏ qua). Chuỗi trả về được sắp xếp theo thứ tự từ ngoài cùng đến trong cùng, được nối bằng `<string>` được chỉ định.

> [!NOTE]
> Để biết thông tin về các bộ đếm không được nối, xem hàm {{cssxref("counter()")}}, hàm này bỏ qua `<string>` làm tham số.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### So sánh giá trị bộ đếm mặc định với chữ số La Mã viết hoa

Ví dụ này bao gồm hai hàm `counters()`: một với `<counter-style>` được đặt và một mặc định là `decimal`.

#### HTML

```html
<ol>
  <li>
    <ol>
      <li></li>
      <li></li>
      <li></li>
    </ol>
  </li>
  <li></li>
  <li></li>
  <li>
    <ol>
      <li></li>
      <li>
        <ol>
          <li></li>
          <li></li>
          <li></li>
        </ol>
      </li>
    </ol>
  </li>
</ol>
```

#### CSS

```css-nolint
ol {
  counter-reset: listCounter;
}
li {
  counter-increment: listCounter;
}
li::marker {
  content:
    counters(listCounter, ".", upper-roman) ") ";
}
li::before {
  content:
    counters(listCounter, ".") " == "
    counters(listCounter, ".", lower-roman);
}
```

#### Kết quả

{{EmbedLiveSample("Comparing default counter value to uppercase roman numerals", "100%", 270)}}

### So sánh giá trị bộ đếm decimal-leading-zero với chữ thường

Ví dụ này bao gồm ba hàm `counters()`, mỗi hàm với các giá trị `<string>` và `<counter-style>` khác nhau.

#### HTML

```html
<ol>
  <li>
    <ol>
      <li></li>
      <li></li>
      <li></li>
    </ol>
  </li>
  <li></li>
  <li></li>
  <li>
    <ol>
      <li></li>
      <li>
        <ol>
          <li></li>
          <li></li>
          <li></li>
        </ol>
      </li>
    </ol>
  </li>
</ol>
```

#### CSS

```css-nolint
ol {
  counter-reset: count;
}
li {
  counter-increment: count;
}
li::marker {
  content:
    counters(count, "-", decimal-leading-zero) ") ";
}
li::before {
  content:
    counters(count, "~", upper-alpha) " == "
    counters(count,  "*", lower-alpha);
}
```

#### Kết quả

{{EmbedLiveSample("Comparing decimal-leading-zero counter value to lowercase letters", "100%", 270)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Counters](/vi/docs/Web/CSS/Guides/Counter_styles/Using_counters)
- Thuộc tính {{cssxref("counter-set")}}
- Thuộc tính {{cssxref("counter-reset")}}
- Thuộc tính {{cssxref("counter-increment")}}
- At-rule {{cssxref("@counter-style")}}
- Hàm CSS [`counter()`](/vi/docs/Web/CSS/Reference/Values/counter)
- Pseudo-element {{cssxref("::marker")}}
- Mô-đun [CSS lists and counters](/vi/docs/Web/CSS/Guides/Lists)
- Mô-đun [CSS counter styles](/vi/docs/Web/CSS/Guides/Counter_styles)
- Mô-đun [CSS generated content](/vi/docs/Web/CSS/Guides/Generated_content)
