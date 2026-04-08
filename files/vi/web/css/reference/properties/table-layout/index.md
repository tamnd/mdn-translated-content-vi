---
title: table-layout
slug: Web/CSS/Reference/Properties/table-layout
page-type: css-property
browser-compat: css.properties.table-layout
sidebar: cssref
---

Thuộc tính **`table-layout`** của [CSS](/vi/docs/Web/CSS) đặt thuật toán được dùng để bố trí các ô, hàng và cột của {{htmlelement("table")}}.

{{InteractiveExample("CSS Demo: table-layout")}}

```css interactive-example-choice
table-layout: auto;
width: 150px;
```

```css interactive-example-choice
table-layout: fixed;
width: 150px;
```

```css interactive-example-choice
table-layout: auto;
width: 100%;
```

```css interactive-example-choice
table-layout: fixed;
width: 100%;
```

```html interactive-example
<section class="default-example" id="default-example">
  <table class="transition-all" id="example-element">
    <tbody>
      <tr>
        <th>Name</th>
        <th>Location</th>
      </tr>
      <tr>
        <td>Lion</td>
        <td>Africa</td>
      </tr>
      <tr>
        <td>Norwegian Lemming</td>
        <td>Europe</td>
      </tr>
      <tr>
        <td>Seal</td>
        <td>Antarctica</td>
      </tr>
      <tr>
        <td>Tiger</td>
        <td>Asia</td>
      </tr>
    </tbody>
  </table>
</section>
```

```css interactive-example
table {
  border: 1px solid #113399;
}

th,
td {
  border: 2px solid #aa1199;
  padding: 0.25rem 0.5rem;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
table-layout: auto;
table-layout: fixed;

/* Giá trị toàn cục */
table-layout: inherit;
table-layout: initial;
table-layout: revert;
table-layout: revert-layer;
table-layout: unset;
```

### Giá trị

- `auto`
  - : Thuật toán bố trí bảng tự động được dùng. Độ rộng của bảng và các ô được điều chỉnh theo nội dung. Hầu hết các trình duyệt sử dụng thuật toán này theo mặc định.

- `fixed`
  - : Thuật toán bố trí bảng cố định được dùng. Khi dùng từ khóa này, độ rộng của bảng _cần được chỉ định rõ ràng_ bằng thuộc tính {{cssxref("width")}}. Nếu giá trị của thuộc tính `width` được đặt thành `auto` hoặc không được chỉ định, trình duyệt sẽ sử dụng thuật toán bố trí bảng tự động, trong trường hợp đó giá trị `fixed` không có hiệu lực.\
    Thuật toán bố trí bảng cố định nhanh hơn thuật toán bố trí tự động vì bố trí ngang của bảng chỉ phụ thuộc vào độ rộng của bảng, độ rộng của các cột, và đường viền hoặc khoảng cách ô. Bố trí ngang không phụ thuộc vào nội dung của các ô vì nó chỉ phụ thuộc vào độ rộng được đặt rõ ràng.

    Trong thuật toán bố trí bảng cố định, độ rộng của mỗi cột được xác định như sau:
    - Phần tử cột có độ rộng rõ ràng sẽ đặt độ rộng cho cột đó.
    - Nếu không, một ô trong hàng đầu tiên có độ rộng rõ ràng sẽ xác định độ rộng cho cột đó.
    - Nếu không, cột sẽ lấy độ rộng từ không gian ngang còn lại được chia sẻ.

    Với thuật toán này, toàn bộ bảng có thể được kết xuất khi hàng bảng đầu tiên đã được tải xuống và phân tích. Điều này có thể tăng tốc độ kết xuất so với phương pháp bố trí "tự động", nhưng nội dung ô tiếp theo có thể không vừa với độ rộng cột đã cung cấp. Các ô sử dụng thuộc tính {{Cssxref("overflow")}} để xác định có cắt bỏ nội dung bị tràn hay không, nhưng chỉ khi bảng có độ rộng đã biết; nếu không, chúng sẽ không tràn ra khỏi các ô.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Bảng có độ rộng cố định với text-overflow

Ví dụ này sử dụng bố trí bảng cố định, kết hợp với thuộc tính {{cssxref("width")}}, để giới hạn độ rộng của bảng. Thuộc tính {{cssxref("text-overflow")}} được dùng để áp dụng dấu ba chấm cho các từ quá dài để vừa. Nếu bố trí bảng là `auto`, bảng sẽ phát triển để chứa nội dung của nó, bất kể `width` đã chỉ định.

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td>Ed</td>
      <td>Wood</td>
    </tr>
    <tr>
      <td>Albert</td>
      <td>Schweitzer</td>
    </tr>
    <tr>
      <td>Jane</td>
      <td>Fonda</td>
    </tr>
    <tr>
      <td>William</td>
      <td>Shakespeare</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  table-layout: fixed;
  width: 120px;
  border: 1px solid red;
}

td {
  border: 1px solid blue;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
```

#### Kết quả

{{EmbedLiveSample('Fixed-width_tables_with_text-overflow')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<table>`](/vi/docs/Web/HTML/Reference/Elements/table)
- [CSS table](/vi/docs/Web/CSS/Guides/Table) module
