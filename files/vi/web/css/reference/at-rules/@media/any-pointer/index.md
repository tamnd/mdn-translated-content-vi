---
title: any-pointer
slug: Web/CSS/Reference/At-rules/@media/any-pointer
page-type: css-media-feature
browser-compat: css.at-rules.media.any-pointer
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) **`any-pointer`** kiểm tra xem người dùng có _bất kỳ_ thiết bị trỏ nào (chẳng hạn như chuột) hay không, và nếu có thì độ chính xác của nó là bao nhiêu.

> [!NOTE]
> Nếu bạn muốn kiểm tra độ chính xác của thiết bị trỏ _chính_, hãy sử dụng [`pointer`](/en-US/docs/Web/CSS/Reference/At-rules/@media/pointer) thay thế.

## Cú pháp

Tính năng `any-pointer` được chỉ định dưới dạng giá trị từ khóa được chọn từ danh sách dưới đây.

- `none`
  - : Không có thiết bị trỏ nào có sẵn.
- `coarse`
  - : Ít nhất một cơ chế nhập liệu bao gồm thiết bị trỏ có độ chính xác hạn chế.
- `fine`
  - : Ít nhất một cơ chế nhập liệu bao gồm thiết bị trỏ chính xác.

> [!NOTE]
> Nhiều hơn một giá trị có thể khớp nếu các thiết bị có sẵn có các đặc tính khác nhau, mặc dù `none` chỉ khớp khi không có thiết bị nào là thiết bị trỏ.

## Ví dụ

Ví dụ này tạo một hộp kiểm nhỏ cho người dùng có ít nhất một con trỏ chính xác và một hộp kiểm lớn cho người dùng có ít nhất một con trỏ thô. Hộp kiểm lớn được ưu tiên vì nó được khai báo sau hộp nhỏ.

### HTML

```html
<input id="test" type="checkbox" /> <label for="test">Nhìn vào tôi!</label>
```

### CSS

```css
input[type="checkbox"]:checked {
  background: gray;
}

@media (any-pointer: fine) {
  input[type="checkbox"] {
    appearance: none;
    width: 15px;
    height: 15px;
    border: 1px solid blue;
  }
}

@media (any-pointer: coarse) {
  input[type="checkbox"] {
    appearance: none;
    width: 30px;
    height: 30px;
    border: 2px solid red;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tính năng media `pointer`](/en-US/docs/Web/CSS/Reference/At-rules/@media/pointer)
