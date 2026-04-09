---
title: translate
slug: Web/XML/XPath/Reference/Functions/translate
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `translate` đánh giá một chuỗi và một tập ký tự để thay thế, rồi trả về chuỗi đã được thay thế.

## Cú pháp

```plain
translate(string, abc, XYZ)
```

### Tham số

- `string`
  - : Chuỗi sẽ được đánh giá.
- `abc`
  - : Chuỗi các ký tự sẽ được thay thế.
- `XYZ`
  - : Chuỗi các ký tự dùng để thay thế. Ký tự đầu tiên trong `XYZ` sẽ thay thế mọi lần xuất hiện của ký tự đầu tiên trong `abc` xuất hiện trong `string`.

### Giá trị trả về

Chuỗi đã được thay thế.

## Mô tả

Với mỗi ký tự trong `string`, nếu `abc` chứa ký tự đó, nó sẽ được thay bằng ký tự ở cùng chỉ số trong `XYZ`. Nếu `abc` không chứa ký tự đó, nó sẽ được giữ nguyên.

- Nếu `abc` dài hơn `XYZ`, các ký tự dư ở cuối `abc` sẽ được ánh xạ thành chuỗi rỗng (tức là chúng bị loại khỏi chuỗi nguồn).
- Nếu `XYZ` chứa nhiều ký tự hơn `abc`, các ký tự dư sẽ bị bỏ qua.
- Nếu một ký tự xuất hiện nhiều lần trong `abc`, lần xuất hiện đầu tiên sẽ quyết định ký tự thay thế.

`translate()` là hàm thay thế từng ký tự, không phải hàm regexp hoặc thay thế chuỗi. Các chuỗi `abc` và `XYZ` biểu thị _mã ký tự_, không phải chuỗi con. Điều này có nghĩa là nếu bạn gặp bất kỳ trường hợp nào ở trên, có thể bạn đang dùng phương thức này không đúng (ngoại trừ có lẽ việc dùng `abc` dài hơn để loại bỏ một số ký tự).

Một phép thay thế như vậy sẽ không cho ra `The quick red fox` như bạn có thể mong đợi; thay vào đó kết quả là `The quick red fdx`.

```xml example-bad
<xsl:value-of select="translate('The quick brown fox', 'brown', 'red')" />
```

## Ví dụ

### Dùng `translate()` để chuyển đổi chữ hoa/thường

XPath lưu ý rằng hàm translate không phải là một giải pháp đủ cho việc chuyển đổi chữ hoa/thường trong mọi ngôn ngữ. Một phiên bản XPath tương lai có thể cung cấp thêm các hàm chuyển đổi chữ hoa/thường.

Tuy nhiên, hiện tại đây là cách gần nhất để chuyển một chuỗi sang chữ hoa hoặc chữ thường.

```xml
<xsl:value-of select="translate('The quick brown fox.', 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
```

Kết quả

```plain
THE QUICK BROWN FOX.
```

## Thông số kỹ thuật

[XPath 1.0 4.2](https://www.w3.org/TR/xpath-10/#function-translate)

## Hỗ trợ Gecko

Được hỗ trợ.
