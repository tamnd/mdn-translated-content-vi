---
title: Right shift (>>)
slug: Web/JavaScript/Reference/Operators/Right_shift
page-type: javascript-operator
browser-compat: javascript.operators.right_shift
sidebar: jssidebar
---

Toán tử **right shift (`>>`)** trả về một số hoặc BigInt có biểu diễn nhị phân là toán hạng đầu tiên được dịch chuyển sang phải theo số bit đã chỉ định. Các bit thừa bị dịch ra khỏi bên phải sẽ bị loại bỏ, và các bản sao của bit ngoài cùng bên trái được đưa vào từ bên trái. Phép toán này còn được gọi là "right shift truyền dấu" hay "arithmetic right shift", vì dấu của số kết quả giống với dấu của toán hạng đầu tiên.

{{InteractiveExample("JavaScript Demo: Right shift (>>) operator")}}

```js interactive-example
const a = 5; //  00000000000000000000000000000101
const b = 2; //  00000000000000000000000000000010
const c = -5; //  11111111111111111111111111111011

console.log(a >> b); //  00000000000000000000000000000001
// Expected output: 1

console.log(c >> b); //  11111111111111111111111111111110
// Expected output: -2
```

## Cú pháp

```js-nolint
x >> y
```

## Mô tả

Toán tử `>>` được nạp chồng cho hai kiểu toán hạng: number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Với number, toán tử trả về số nguyên 32-bit. Với BigInt, toán tử trả về BigInt. Đầu tiên, nó [ép kiểu cả hai toán hạng về giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện BigInt right shift nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó chuyển đổi cả hai toán hạng về [số nguyên 32-bit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion) và thực hiện right shift trên số. {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành number.

Vì bit ngoài cùng bên trái mới có cùng giá trị với bit ngoài cùng bên trái trước đó, bit dấu (bit ngoài cùng bên trái) không thay đổi. Đó là lý do có tên "truyền dấu".

Toán tử hoạt động trên biểu diễn bit của toán hạng bên trái theo dạng [bù hai (two's complement)](https://en.wikipedia.org/wiki/Two's_complement). Xét biểu diễn nhị phân 32-bit của các số thập phân (cơ số 10) `9` và `-9`:

```plain
     9 (base 10): 00000000000000000000000000001001 (base 2)
    -9 (base 10): 11111111111111111111111111110111 (base 2)
```

Biểu diễn nhị phân theo dạng bù hai của số thập phân âm `-9` được tạo bằng cách đảo ngược tất cả các bit của số đối lập của nó là `9` và `00000000000000000000000000001001` trong nhị phân, rồi cộng thêm `1`.

Trong cả hai trường hợp, dấu của số nhị phân được xác định bởi bit ngoài cùng bên trái: đối với số thập phân dương `9`, bit ngoài cùng bên trái của biểu diễn nhị phân là `0`, và đối với số thập phân âm `-9`, bit ngoài cùng bên trái là `1`.

Với các biểu diễn nhị phân đó của các số thập phân `9` và `-9`:

`9 >> 2` cho kết quả 2:

```plain
     9 (base 10): 00000000000000000000000000001001 (base 2)
                  --------------------------------
9 >> 2 (base 10): 00000000000000000000000000000010 (base 2) = 2 (base 10)
```

Hãy chú ý rằng hai bit ngoài cùng bên phải, `01`, đã bị dịch ra, và hai bản sao của bit ngoài cùng bên trái, `0`, đã được đưa vào từ bên trái.

`-9 >> 2` cho kết quả `-3`:

```plain
     -9 (base 10): 11111111111111111111111111110111 (base 2)
                   --------------------------------
-9 >> 2 (base 10): 11111111111111111111111111111101 (base 2) = -3 (base 10)
```

Hãy chú ý rằng hai bit ngoài cùng bên phải, `11`, đã bị dịch ra. Nhưng về các bit ngoài cùng bên trái: trong trường hợp này, bit ngoài cùng bên trái là `1`. Vì vậy, hai bản sao của bit `1` ngoài cùng bên trái đó đã được đưa vào từ bên trái — điều này bảo toàn dấu âm.

Biểu diễn nhị phân `11111111111111111111111111111101` bằng số thập phân âm `-3`, vì tất cả các số nguyên âm được lưu trữ dưới dạng [bù hai](https://en.wikipedia.org/wiki/Two's_complement), và số này có thể được tính bằng cách đảo ngược tất cả các bit của biểu diễn nhị phân của số thập phân dương `3`, là `00000000000000000000000000000011`, rồi cộng thêm một.

Nếu toán hạng bên trái là một số có nhiều hơn 32 bit, các bit có trọng số cao nhất sẽ bị loại bỏ. Ví dụ, số nguyên sau có nhiều hơn 32 bit sẽ được chuyển đổi thành số nguyên 32-bit:

```plain
Before: 11100110111110100000000000000110000000000001
After:              10100000000000000110000000000001
```

Toán hạng bên phải sẽ được chuyển đổi thành số nguyên 32-bit không dấu và sau đó lấy modulo 32, vì vậy độ lệch dịch chuyển thực tế luôn là một số nguyên dương từ 0 đến 31, bao gồm cả hai đầu. Ví dụ, `100 >> 32` giống như `100 >> 0` (và tạo ra `100`) vì 32 modulo 32 là 0.

> [!WARNING]
> Bạn có thể thấy người ta dùng `>> 0` để cắt ngắn số thành số nguyên. Right shift bất kỳ số `x` nào sang phải `0` bit trả về `x` được chuyển đổi thành số nguyên 32-bit, đồng thời loại bỏ các bit đầu cho các số ngoài khoảng -2147483648 đến 2147483647. Hãy dùng [`Math.trunc()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc#using_bitwise_no-ops_to_truncate_numbers) thay thế.

Với BigInt, không có cắt ngắn. Về mặt khái niệm, hiểu rằng các BigInt dương có vô số bit `0` đứng đầu, và các BigInt âm có vô số bit `1` đứng đầu.

## Ví dụ

### Sử dụng right shift

```js
9 >> 2; // 2
-9 >> 2; // -3

9n >> 2n; // 2n
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các toán tử bitwise trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators)
- [Right shift assignment (`>>=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift_assignment)
- [Unsigned right shift (`>>>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift)
