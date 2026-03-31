---
title: Unsigned right shift (>>>)
slug: Web/JavaScript/Reference/Operators/Unsigned_right_shift
page-type: javascript-operator
browser-compat: javascript.operators.unsigned_right_shift
sidebar: jssidebar
---

Toán tử **unsigned right shift (`>>>`)** trả về một số có biểu diễn nhị phân là toán hạng đầu tiên được dịch chuyển sang phải theo số bit đã chỉ định. Các bit thừa bị dịch ra khỏi bên phải sẽ bị loại bỏ, và các bit zero được đưa vào từ bên trái. Phép toán này còn được gọi là "zero-filling right shift", vì bit dấu trở thành `0`, nên số kết quả luôn là dương. Unsigned right shift không chấp nhận giá trị [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt).

{{InteractiveExample("JavaScript Demo: Unsigned right shift (>>>) operator")}}

```js interactive-example
const a = 5; //  00000000000000000000000000000101
const b = 2; //  00000000000000000000000000000010
const c = -5; //  11111111111111111111111111111011

console.log(a >>> b); //  00000000000000000000000000000001
// Expected output: 1

console.log(c >>> b); //  00111111111111111111111111111110
// Expected output: 1073741822
```

## Cú pháp

```js-nolint
x >>> y
```

## Mô tả

Không giống các toán tử số học và bitwise khác, unsigned right shift operator không chấp nhận giá trị [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Điều này là do nó điền các bit ngoài cùng bên trái bằng zero, nhưng về mặt khái niệm, BigInt có vô số bit dấu đứng đầu, nên không có "bit ngoài cùng bên trái" để điền zero.

Toán tử hoạt động trên biểu diễn bit của toán hạng bên trái theo dạng [bù hai (two's complement)](https://en.wikipedia.org/wiki/Two's_complement). Xét biểu diễn nhị phân 32-bit của các số thập phân (cơ số 10) `9` và `-9`:

```plain
     9 (base 10): 00000000000000000000000000001001 (base 2)
    -9 (base 10): 11111111111111111111111111110111 (base 2)
```

Biểu diễn nhị phân theo dạng bù hai của số thập phân âm `-9` được tạo bằng cách đảo ngược tất cả các bit của số đối lập của nó là `9` và `00000000000000000000000000001001` trong nhị phân, rồi cộng thêm `1`.

Trong cả hai trường hợp, dấu của số nhị phân được xác định bởi bit ngoài cùng bên trái: đối với số thập phân dương `9`, bit ngoài cùng bên trái của biểu diễn nhị phân là `0`, và đối với số thập phân âm `-9`, bit ngoài cùng bên trái là `1`.

Với các biểu diễn nhị phân đó của các số thập phân `9` và `-9`:

Đối với số dương `9`, zero-fill right shift và [sign-propagating right shift](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift) cho cùng kết quả: `9 >>> 2` cho kết quả `2`, giống như `9 >> 2`:

```plain
      9 (base 10): 00000000000000000000000000001001 (base 2)
                   --------------------------------
9 >>  2 (base 10): 00000000000000000000000000000010 (base 2) = 2 (base 10)
9 >>> 2 (base 10): 00000000000000000000000000000010 (base 2) = 2 (base 10)
```

Hãy chú ý rằng hai bit ngoài cùng bên phải, `01`, đã bị dịch ra, và hai số zero đã được đưa vào từ bên trái.

Tuy nhiên, hãy chú ý điều gì xảy ra với `-9`: `-9 >> 2` ([sign-propagating right shift](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift)) cho kết quả `-3`, nhưng `-9 >>> 2` (zero-fill right shift) cho kết quả 1073741821:

```plain
      -9 (base 10): 11111111111111111111111111110111 (base 2)
                    --------------------------------
-9 >>  2 (base 10): 11111111111111111111111111111101 (base 2) = -3 (base 10)
-9 >>> 2 (base 10): 00111111111111111111111111111101 (base 2) = 1073741821 (base 10)
```

Hãy chú ý rằng hai bit ngoài cùng bên phải, `11`, đã bị dịch ra. Đối với `-9 >> 2` ([sign-propagating right shift](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift)), hai bản sao của bit `1` ngoài cùng bên trái đã được đưa vào từ bên trái, điều này bảo toàn dấu âm. Mặt khác, đối với `-9 >>> 2` (zero-fill right shift), các số zero đã được đưa vào từ bên trái, nên dấu âm của số không được bảo toàn, và kết quả là một số dương (lớn).

Nếu toán hạng bên trái là một số có nhiều hơn 32 bit, các bit có trọng số cao nhất sẽ bị loại bỏ. Ví dụ, số nguyên sau có nhiều hơn 32 bit sẽ được chuyển đổi thành số nguyên 32-bit:

```plain
Before: 11100110111110100000000000000110000000000001
After:              10100000000000000110000000000001
```

Toán hạng bên phải sẽ được chuyển đổi thành số nguyên 32-bit không dấu và sau đó lấy modulo 32, vì vậy độ lệch dịch chuyển thực tế luôn là một số nguyên dương từ 0 đến 31, bao gồm cả hai đầu. Ví dụ, `100 >>> 32` giống như `100 >>> 0` (và tạo ra `100`) vì 32 modulo 32 là 0.

## Ví dụ

### Sử dụng unsigned right shift

```js
9 >>> 2; // 2
-9 >>> 2; // 1073741821
```

Unsigned right shift không hoạt động với BigInt.

```js
9n >>> 2n; // TypeError: BigInts have no unsigned right shift, use >> instead
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các toán tử bitwise trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators)
- [Unsigned right shift assignment (`>>>=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift_assignment)
