---
title: pointer
slug: Web/CSS/Reference/At-rules/@media/pointer
page-type: css-media-feature
browser-compat: css.at-rules.media.pointer
sidebar: cssref
---

Đặc trưng media CSS **`pointer`** kiểm tra xem người dùng có thiết bị trỏ (như chuột) hay không, và nếu có, thì thiết bị trỏ _chính_ đó có độ chính xác như thế nào.

> [!NOTE]
> Nếu bạn muốn kiểm tra độ chính xác của _bất kỳ_ thiết bị trỏ nào, hãy dùng [`any-pointer`](/en-US/docs/Web/CSS/Reference/At-rules/@media/any-pointer) thay thế.

## Cú pháp

Đặc trưng `pointer` được chỉ định là một giá trị từ khóa chọn từ danh sách bên dưới.

- `none`
  - : Cơ chế đầu vào chính không bao gồm thiết bị trỏ.
- `coarse`
  - : Cơ chế đầu vào chính bao gồm thiết bị trỏ có độ chính xác hạn chế, chẳng hạn như ngón tay trên màn hình cảm ứng.
- `fine`
  - : Cơ chế đầu vào chính bao gồm thiết bị trỏ chính xác, chẳng hạn như chuột.

## Ví dụ

Ví dụ này tạo một hộp kiểm nhỏ cho người dùng có thiết bị trỏ chính xác cao và một hộp kiểm lớn cho người dùng có thiết bị trỏ kém chính xác.

### HTML

```html
<input id="test" type="checkbox" /> <label for="test">Look at me!</label>
```

### CSS

```css
input[type="checkbox"] {
  appearance: none;
  border: solid;
  margin: 0;
}

input[type="checkbox"]:checked {
  background: gray;
}

@media (pointer: fine) {
  input[type="checkbox"] {
    width: 15px;
    height: 15px;
    border-width: 1px;
    border-color: blue;
  }
}

@media (pointer: coarse) {
  input[type="checkbox"] {
    width: 30px;
    height: 30px;
    border-width: 2px;
    border-color: red;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Đặc trưng media `any-pointer`](/en-US/docs/Web/CSS/Reference/At-rules/@media/any-pointer)
