---
title: Functions
slug: Web/JavaScript/Guide/Functions
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Loops_and_iteration", "Web/JavaScript/Guide/Expressions_and_operators")}}

Hàm là một trong những khối cấu trúc cơ bản trong JavaScript. Một hàm trong JavaScript tương tự như một thủ tục — một tập hợp các câu lệnh thực hiện một nhiệm vụ hoặc tính toán một giá trị, nhưng để một thủ tục có thể coi là hàm, nó phải nhận một số đầu vào và trả về đầu ra có mối quan hệ rõ ràng với đầu vào đó. Để sử dụng một hàm, bạn phải định nghĩa nó ở đâu đó trong phạm vi mà bạn muốn gọi nó.

Xem thêm [chương tham khảo đầy đủ về hàm JavaScript](/en-US/docs/Web/JavaScript/Reference/Functions) để tìm hiểu chi tiết.

## Định nghĩa hàm

### Khai báo hàm

Một **định nghĩa hàm** (còn gọi là **khai báo hàm**, hay **câu lệnh hàm**) bao gồm từ khóa [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function), theo sau là:

- Tên của hàm.
- Danh sách các tham số của hàm, được đặt trong dấu ngoặc đơn và phân tách bằng dấu phẩy.
- Các câu lệnh JavaScript định nghĩa hàm, được đặt trong dấu ngoặc nhọn, `{ /* … */ }`.

Ví dụ, đoạn code sau định nghĩa một hàm tên là `square`:

```js
function square(number) {
  return number * number;
}
```

Hàm `square` nhận một tham số, được gọi là `number`. Hàm bao gồm một câu lệnh yêu cầu trả về tham số của hàm (tức là `number`) nhân với chính nó. Câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) chỉ định giá trị được trả về bởi hàm, đó là `number * number`.

Các tham số về cơ bản được truyền vào hàm **theo giá trị** — vì vậy nếu code bên trong thân hàm gán một giá trị hoàn toàn mới cho tham số đã được truyền vào, **sự thay đổi đó không được phản ánh ra bên ngoài hay trong code đã gọi hàm đó**.

Khi bạn truyền một object làm tham số, nếu hàm thay đổi các thuộc tính của object, sự thay đổi đó có thể nhìn thấy bên ngoài hàm, như được minh họa trong ví dụ sau:

```js
function myFunc(theObject) {
  theObject.make = "Toyota";
}

const myCar = {
  make: "Honda",
  model: "Accord",
  year: 1998,
};

console.log(myCar.make); // "Honda"
myFunc(myCar);
console.log(myCar.make); // "Toyota"
```

Khi bạn truyền một mảng làm tham số, nếu hàm thay đổi bất kỳ giá trị nào của mảng, sự thay đổi đó có thể nhìn thấy bên ngoài hàm, như được minh họa trong ví dụ sau:

```js
function myFunc(theArr) {
  theArr[0] = 30;
}

const arr = [45];

console.log(arr[0]); // 45
myFunc(arr);
console.log(arr[0]); // 30
```

Khai báo hàm và biểu thức hàm có thể được lồng vào nhau, tạo thành một _chuỗi phạm vi_. Ví dụ:

```js
function addSquares(a, b) {
  function square(x) {
    return x * x;
  }
  return square(a) + square(b);
}
```

Xem [phạm vi hàm và closure](#function_scopes_and_closures) để biết thêm thông tin.

### Biểu thức hàm

Trong khi khai báo hàm ở trên về mặt cú pháp là một câu lệnh, hàm cũng có thể được tạo ra bằng một [biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function).

Một hàm như vậy có thể là **ẩn danh**; nó không nhất thiết phải có tên. Ví dụ, hàm `square` có thể được định nghĩa như sau:

```js
const square = function (number) {
  return number * number;
};

console.log(square(4)); // 16
```

Tuy nhiên, tên _có thể_ được cung cấp trong biểu thức hàm. Việc cung cấp tên cho phép hàm tự tham chiếu đến chính nó, và cũng giúp dễ dàng xác định hàm trong stack traces của debugger:

```js
const factorial = function fac(n) {
  return n < 2 ? 1 : n * fac(n - 1);
};

console.log(factorial(3)); // 6
```

Biểu thức hàm rất tiện lợi khi truyền một hàm làm đối số cho hàm khác. Ví dụ sau định nghĩa hàm `map` nhận một hàm làm đối số đầu tiên và một mảng làm đối số thứ hai. Sau đó, nó được gọi với một hàm được định nghĩa bằng biểu thức hàm:

```js
function map(f, a) {
  const result = new Array(a.length);
  for (let i = 0; i < a.length; i++) {
    result[i] = f(a[i]);
  }
  return result;
}

const numbers = [0, 1, 2, 5, 10];
const cubedNumbers = map(function (x) {
  return x * x * x;
}, numbers);
console.log(cubedNumbers); // [0, 1, 8, 125, 1000]
```

Trong JavaScript, một hàm có thể được định nghĩa dựa trên một điều kiện. Ví dụ, định nghĩa hàm sau chỉ định nghĩa `myFunc` nếu `num` bằng `0`:

```js
let myFunc;
if (num === 0) {
  myFunc = function (theObject) {
    theObject.make = "Toyota";
  };
}
```

Ngoài việc định nghĩa hàm như mô tả ở đây, bạn cũng có thể sử dụng constructor {{jsxref("Function")}} để tạo hàm từ một chuỗi trong lúc chạy, tương tự như {{jsxref("Global_Objects/eval", "eval()")}}.

Một **method** là hàm là thuộc tính của một object. Đọc thêm về object và method trong [Làm việc với object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).

## Gọi hàm

_Định nghĩa_ một hàm không _thực thi_ nó. Định nghĩa nó đặt tên cho hàm và chỉ định những gì cần làm khi hàm được gọi.

**Gọi** hàm thực sự thực hiện các hành động đã chỉ định với các tham số được chỉ định. Ví dụ, nếu bạn định nghĩa hàm `square`, bạn có thể gọi nó như sau:

```js
square(5);
```

Câu lệnh trên gọi hàm với đối số là `5`. Hàm thực thi các câu lệnh của nó và trả về giá trị `25`.

Các hàm phải _trong phạm vi_ khi chúng được gọi, nhưng khai báo hàm có thể được [hoisted](#function_hoisting) (xuất hiện bên dưới lệnh gọi trong code). Phạm vi của khai báo hàm là hàm mà nó được khai báo trong đó (hoặc toàn bộ chương trình, nếu nó được khai báo ở cấp độ đầu).

Các đối số của hàm không bị giới hạn ở chuỗi và số. Bạn có thể truyền toàn bộ object vào hàm. Hàm `showProps()` (được định nghĩa trong [Làm việc với object](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#objects_and_properties)) là một ví dụ về hàm nhận một object làm đối số.

Một hàm có thể gọi chính nó. Ví dụ, đây là một hàm tính giai thừa đệ quy:

```js
function factorial(n) {
  if (n === 0 || n === 1) {
    return 1;
  }
  return n * factorial(n - 1);
}
```

Sau đó bạn có thể tính giai thừa của `1` đến `5` như sau:

```js
console.log(factorial(1)); // 1
console.log(factorial(2)); // 2
console.log(factorial(3)); // 6
console.log(factorial(4)); // 24
console.log(factorial(5)); // 120
```

Có những cách khác để gọi hàm. Thường có những trường hợp hàm cần được gọi động, hoặc số lượng đối số của hàm thay đổi, hoặc ngữ cảnh của lời gọi hàm cần được đặt thành một object cụ thể được xác định trong lúc chạy.

Hóa ra _bản thân các hàm cũng là object_ — và theo đó, các object này có các method. (Xem object {{jsxref("Function")}}.) Các method [`call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) và [`apply()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) có thể được sử dụng để đạt được mục tiêu này.

### Hoisting hàm

Xem xét ví dụ dưới đây:

```js
console.log(square(5)); // 25

function square(n) {
  return n * n;
}
```

Code này chạy không có lỗi, mặc dù hàm `square()` được gọi trước khi nó được khai báo. Điều này là vì trình thông dịch JavaScript hoists toàn bộ khai báo hàm lên đầu phạm vi hiện tại, vì vậy code trên tương đương với:

```js
// All function declarations are effectively at the top of the scope
function square(n) {
  return n * n;
}

console.log(square(5)); // 25
```

Hoisting hàm chỉ hoạt động với _khai báo_ hàm — không hoạt động với _biểu thức_ hàm. Code sau sẽ không hoạt động:

```js example-bad
console.log(square(5)); // ReferenceError: Cannot access 'square' before initialization
const square = function (n) {
  return n * n;
};
```

### Đệ quy

Một hàm có thể tham chiếu và gọi chính nó. Nó có thể được tham chiếu bằng tên biểu thức hàm hoặc khai báo, hoặc thông qua bất kỳ biến nào trong phạm vi tham chiếu đến object hàm. Ví dụ, xem xét định nghĩa hàm sau:

```js
const foo = function bar() {
  // statements go here
};
```

Trong thân hàm, bạn có thể tham chiếu đến chính hàm đó bằng `bar` hoặc `foo`, và gọi nó bằng `bar()` hoặc `foo()`.

Một hàm gọi chính nó được gọi là _hàm đệ quy_. Theo một số cách, đệ quy tương tự như vòng lặp. Cả hai thực thi cùng một code nhiều lần, và cả hai đều yêu cầu một điều kiện (để tránh vòng lặp vô hạn, hay đúng hơn là đệ quy vô hạn trong trường hợp này).

Ví dụ, xem xét vòng lặp sau:

```js
let x = 0;
// "x < 10" is the loop condition
while (x < 10) {
  // do stuff
  x++;
}
```

Nó có thể được chuyển đổi thành khai báo hàm đệ quy, theo sau là một lời gọi đến hàm đó:

```js
function loop(x) {
  // "x >= 10" is the exit condition (equivalent to "!(x < 10)")
  if (x >= 10) {
    return;
  }
  // do stuff
  loop(x + 1); // the recursive call
}
loop(0);
```

Tuy nhiên, một số thuật toán không thể là các vòng lặp lặp đơn giản. Ví dụ, việc lấy tất cả các node của cấu trúc cây (như [DOM](/en-US/docs/Web/API/Document_Object_Model)) dễ dàng hơn qua đệ quy:

```js
function walkTree(node) {
  if (node === null) {
    return;
  }
  // do something with node
  for (const child of node.childNodes) {
    walkTree(child);
  }
}
```

So với hàm `loop`, mỗi lời gọi đệ quy ở đây tự nó thực hiện nhiều lời gọi đệ quy.

Có thể chuyển đổi bất kỳ thuật toán đệ quy nào thành thuật toán không đệ quy, nhưng logic thường phức tạp hơn nhiều, và cần sử dụng stack.

Thực ra, đệ quy bản thân nó sử dụng một stack: stack hàm. Hành vi giống stack có thể được thấy trong ví dụ sau:

```js
function foo(i) {
  if (i < 0) {
    return;
  }
  console.log(`begin: ${i}`);
  foo(i - 1);
  console.log(`end: ${i}`);
}
foo(3);

// Logs:
// begin: 3
// begin: 2
// begin: 1
// begin: 0
// end: 0
// end: 1
// end: 2
// end: 3
```

### Biểu thức hàm được gọi ngay lập tức (IIFE)

Một [Biểu thức hàm được gọi ngay lập tức (IIFE)](/en-US/docs/Glossary/IIFE) là một mẫu code gọi trực tiếp một hàm được định nghĩa dưới dạng biểu thức. Nó trông như thế này:

```js
(function () {
  // Do something
})();

const value = (function () {
  // Do something
  return someValue;
})();
```

Thay vì lưu hàm vào một biến, hàm được gọi ngay lập tức. Điều này gần như tương đương với việc chỉ viết thân hàm, nhưng có một số lợi ích độc đáo:

- Nó tạo ra một [phạm vi](#function_scopes_and_closures) biến thêm, giúp giới hạn các biến vào nơi chúng hữu ích.
- Bây giờ nó là một _biểu thức_ thay vì một chuỗi _câu lệnh_. Điều này cho phép bạn viết logic tính toán phức tạp khi khởi tạo các biến.

Để biết thêm thông tin, hãy xem mục từ [IIFE](/en-US/docs/Glossary/IIFE) trong bảng thuật ngữ.

## Phạm vi hàm và closure

Các hàm tạo thành một [phạm vi](/en-US/docs/Glossary/Scope) cho các biến — điều này có nghĩa là các biến được định nghĩa bên trong hàm không thể truy cập từ bất kỳ nơi nào bên ngoài hàm. Phạm vi hàm kế thừa từ tất cả các phạm vi cha. Ví dụ, một hàm được định nghĩa trong phạm vi toàn cục có thể truy cập tất cả các biến được định nghĩa trong phạm vi toàn cục. Một hàm được định nghĩa bên trong hàm khác cũng có thể truy cập tất cả các biến được định nghĩa trong hàm cha, và bất kỳ biến nào mà hàm cha có quyền truy cập. Mặt khác, hàm cha (và bất kỳ phạm vi cha nào khác) _không_ có quyền truy cập vào các biến và hàm được định nghĩa bên trong hàm bên trong. Điều này cung cấp một loại đóng gói cho các biến trong hàm bên trong.

```js
// The following variables are defined in the global scope
const num1 = 20;
const num2 = 3;
const name = "Chamakh";

// This function is defined in the global scope
function multiply() {
  return num1 * num2;
}

console.log(multiply()); // 60

// A nested function example
function getScore() {
  const num1 = 2;
  const num2 = 3;

  function add() {
    return `${name} scored ${num1 + num2}`;
  }

  return add();
}

console.log(getScore()); // "Chamakh scored 5"
```

### Closure

Chúng ta cũng gọi thân hàm là một _closure_. Closure là bất kỳ đoạn code nguồn nào (thường nhất là một hàm) tham chiếu đến một số biến, và closure "ghi nhớ" các biến này ngay cả khi phạm vi mà các biến này được khai báo đã kết thúc.

Closure thường được minh họa với các hàm lồng nhau để cho thấy rằng chúng ghi nhớ các biến vượt qua tuổi thọ của phạm vi cha; nhưng trên thực tế, các hàm lồng nhau là không cần thiết. Về mặt kỹ thuật, tất cả các hàm trong JavaScript đều tạo thành closure — một số chỉ không nắm bắt gì, và closure thậm chí không cần phải là hàm. Các yếu tố chính cho một closure _hữu ích_ là:

- Một phạm vi cha định nghĩa một số biến hoặc hàm. Nó phải có một vòng đời rõ ràng, có nghĩa là nó phải kết thúc thực thi tại một thời điểm nào đó. Bất kỳ phạm vi nào không phải là phạm vi toàn cục đều thỏa mãn yêu cầu này; điều này bao gồm các khối, hàm, module, và nhiều hơn nữa.
- Một phạm vi bên trong được định nghĩa trong phạm vi cha, tham chiếu đến một số biến hoặc hàm được định nghĩa trong phạm vi cha.
- Phạm vi bên trong quản lý để tồn tại vượt qua tuổi thọ của phạm vi cha. Ví dụ, nó được lưu vào một biến được định nghĩa bên ngoài phạm vi cha, hoặc nó được trả về từ phạm vi cha (nếu phạm vi cha là một hàm).
- Sau đó, khi bạn gọi hàm bên ngoài phạm vi cha, bạn vẫn có thể truy cập các biến hoặc hàm được định nghĩa trong phạm vi cha, mặc dù phạm vi cha đã kết thúc thực thi.

Sau đây là một ví dụ điển hình về closure:

```js
// The outer function defines a variable called "name"
const pet = function (name) {
  const getName = function () {
    // The inner function has access to the "name" variable of the outer function
    return name;
  };
  return getName; // Return the inner function, thereby exposing it to outer scopes
};
const myPet = pet("Vivie");

console.log(myPet()); // "Vivie"
```

Nó có thể phức tạp hơn nhiều so với code trên. Một object chứa các method để thao tác các biến bên trong của hàm bên ngoài có thể được trả về.

```js
const createPet = function (name) {
  let sex;

  const pet = {
    // setName(newName) is equivalent to setName: function (newName)
    // in this context
    setName(newName) {
      name = newName;
    },

    getName() {
      return name;
    },

    getSex() {
      return sex;
    },

    setSex(newSex) {
      if (
        typeof newSex === "string" &&
        (newSex.toLowerCase() === "male" || newSex.toLowerCase() === "female")
      ) {
        sex = newSex;
      }
    },
  };

  return pet;
};

const pet = createPet("Vivie");
console.log(pet.getName()); // Vivie

pet.setName("Oliver");
pet.setSex("male");
console.log(pet.getSex()); // male
console.log(pet.getName()); // Oliver
```

Trong code trên, biến `name` của hàm bên ngoài có thể truy cập được từ các hàm bên trong, và không có cách nào khác để truy cập các biến bên trong ngoài thông qua các hàm bên trong. Các biến bên trong của các hàm bên trong hoạt động như các kho lưu trữ an toàn cho các đối số và biến bên ngoài. Chúng giữ dữ liệu "bền vững" và "được đóng gói" để các hàm bên trong làm việc. Các hàm thậm chí không cần được gán cho một biến, hoặc có tên.

```js
const getCode = (function () {
  const apiCode = "0]Eal(eh&2"; // A code we do not want outsiders to be able to modify…

  return function () {
    return apiCode;
  };
})();

console.log(getCode()); // "0]Eal(eh&2"
```

Trong code trên, chúng ta sử dụng mẫu [IIFE](#immediately_invoked_function_expressions_iife). Trong phạm vi IIFE này, hai giá trị tồn tại: biến `apiCode` và một hàm ẩn danh được trả về và được gán cho biến `getCode`. `apiCode` nằm trong phạm vi của hàm ẩn danh được trả về nhưng không nằm trong phạm vi của bất kỳ phần nào khác của chương trình, vì vậy không có cách nào để đọc giá trị của `apiCode` ngoài qua hàm `getCode`.

### Hàm lồng nhiều cấp

Các hàm có thể được lồng nhiều cấp. Ví dụ:

- Một hàm (`A`) chứa một hàm (`B`), bản thân hàm đó chứa một hàm (`C`).
- Cả hai hàm `B` và `C` đều tạo thành closure ở đây. Vì vậy, `B` có thể truy cập `A`, và `C` có thể truy cập `B`.
- Ngoài ra, vì `C` có thể truy cập `B` mà có thể truy cập `A`, `C` cũng có thể truy cập `A`.

Như vậy, các closure có thể chứa nhiều phạm vi; chúng đệ quy chứa phạm vi của các hàm chứa nó. Đây được gọi là _chuỗi phạm vi_. Xem xét ví dụ sau:

```js
function A(x) {
  function B(y) {
    function C(z) {
      console.log(x + y + z);
    }
    C(3);
  }
  B(2);
}
A(1); // Logs 6 (which is 1 + 2 + 3)
```

Trong ví dụ này, `C` truy cập `y` của `B` và `x` của `A`. Điều này có thể thực hiện được vì:

1. `B` tạo thành closure bao gồm `A` (tức là `B` có thể truy cập các đối số và biến của `A`).
2. `C` tạo thành closure bao gồm `B`.
3. Vì closure của `C` bao gồm `B` và closure của `B` bao gồm `A`, closure của `C` cũng bao gồm `A`. Điều này có nghĩa là `C` có thể truy cập _cả hai_ đối số và biến của `B` _và_ `A`. Nói cách khác, `C` _liên kết_ phạm vi của `B` và `A`, _theo thứ tự đó_.

Tuy nhiên, điều ngược lại không đúng. `A` không thể truy cập `C`, vì `A` không thể truy cập bất kỳ đối số hay biến nào của `B`, mà `C` là biến của `B`. Do đó, `C` vẫn ở chế độ riêng tư chỉ với `B`.

### Xung đột tên

Khi hai đối số hoặc biến trong phạm vi của một closure có cùng tên, có một _xung đột tên_. Các phạm vi lồng sâu hơn có ưu tiên cao hơn. Vì vậy, phạm vi trong cùng nhất có ưu tiên cao nhất, trong khi phạm vi ngoài cùng nhất có ưu tiên thấp nhất. Đây là chuỗi phạm vi. Đầu tiên trong chuỗi là phạm vi trong cùng nhất, và cuối cùng là phạm vi ngoài cùng nhất. Xem xét như sau:

```js
function outside() {
  const x = 5;
  function inside(x) {
    return x * 2;
  }
  return inside;
}

console.log(outside()(10)); // 20 (instead of 10)
```

Xung đột tên xảy ra ở câu lệnh `return x * 2` và là giữa tham số `x` của `inside` và biến `x` của `outside`. Chuỗi phạm vi ở đây là `inside` => `outside` => global object. Do đó, `x` của `inside` có ưu tiên cao hơn `x` của `outside`, và `20` (`x` của `inside`) được trả về thay vì `10` (`x` của `outside`).

## Sử dụng object arguments

Các đối số của hàm được duy trì trong một object giống mảng. Bên trong hàm, bạn có thể truy cập các đối số được truyền vào như sau:

```js
arguments[i];
```

trong đó `i` là số thứ tự của đối số, bắt đầu từ `0`. Vì vậy, đối số đầu tiên được truyền vào hàm sẽ là `arguments[0]`. Tổng số đối số được chỉ định bởi `arguments.length`.

Sử dụng object `arguments`, bạn có thể gọi hàm với nhiều đối số hơn số được khai báo chính thức để nhận. Điều này thường hữu ích nếu bạn không biết trước có bao nhiêu đối số sẽ được truyền vào hàm. Bạn có thể sử dụng `arguments.length` để xác định số lượng đối số thực sự được truyền vào hàm, và sau đó truy cập từng đối số bằng object `arguments`.

Ví dụ, xem xét hàm nối nhiều chuỗi lại. Đối số chính thức duy nhất cho hàm là một chuỗi chỉ định các ký tự phân tách các mục cần nối. Hàm được định nghĩa như sau:

```js
function myConcat(separator) {
  let result = ""; // initialize list
  // iterate through arguments
  for (let i = 1; i < arguments.length; i++) {
    result += arguments[i] + separator;
  }
  return result;
}
```

Bạn có thể truyền bất kỳ số lượng đối số nào vào hàm này, và nó nối từng đối số vào một "danh sách" chuỗi:

```js
console.log(myConcat(", ", "red", "orange", "blue"));
// "red, orange, blue, "

console.log(myConcat("; ", "elephant", "giraffe", "lion", "cheetah"));
// "elephant; giraffe; lion; cheetah; "

console.log(myConcat(". ", "sage", "basil", "oregano", "pepper", "parsley"));
// "sage. basil. oregano. pepper. parsley. "
```

> [!NOTE]
> Biến `arguments` là "giống mảng", nhưng không phải mảng. Nó giống mảng ở chỗ nó có chỉ số đánh số và thuộc tính `length`. Tuy nhiên, nó _không_ sở hữu tất cả các phương thức thao tác mảng.

Xem object {{jsxref("Function")}} trong tài liệu tham khảo JavaScript để biết thêm thông tin.

## Tham số hàm

Có hai loại cú pháp tham số đặc biệt: _tham số mặc định_ và _tham số rest_.

### Tham số mặc định

Trong JavaScript, các tham số của hàm mặc định là `undefined`. Tuy nhiên, trong một số tình huống, có thể hữu ích khi đặt giá trị mặc định khác. Đây chính xác là những gì tham số mặc định làm.

Trước đây, chiến lược chung để đặt giá trị mặc định là kiểm tra các giá trị tham số trong thân hàm và gán một giá trị nếu chúng là `undefined`.

Trong ví dụ sau, nếu không có giá trị nào được cung cấp cho `b`, giá trị của nó sẽ là `undefined` khi đánh giá `a*b`, và lời gọi đến `multiply` thường sẽ trả về `NaN`. Tuy nhiên, điều này được ngăn chặn bởi dòng thứ hai trong ví dụ này:

```js
function multiply(a, b) {
  b = typeof b !== "undefined" ? b : 1;
  return a * b;
}

console.log(multiply(5)); // 5
```

Với _tham số mặc định_, kiểm tra thủ công trong thân hàm không còn cần thiết. Bạn có thể đặt `1` là giá trị mặc định cho `b` trong phần đầu hàm:

```js
function multiply(a, b = 1) {
  return a * b;
}

console.log(multiply(5)); // 5
```

Để biết thêm chi tiết, xem [tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) trong tài liệu tham khảo.

### Tham số rest

Cú pháp [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) cho phép chúng ta biểu diễn một số lượng đối số không xác định dưới dạng mảng.

Trong ví dụ sau, hàm `multiply` sử dụng _tham số rest_ để thu thập các đối số từ đối số thứ hai trở đi. Sau đó hàm nhân chúng với đối số đầu tiên.

```js
function multiply(multiplier, ...theArgs) {
  return theArgs.map((x) => multiplier * x);
}

const arr = multiply(2, 1, 2, 3);
console.log(arr); // [2, 4, 6]
```

## Hàm mũi tên

Một [biểu thức hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) (còn gọi là _fat arrow_ để phân biệt với cú pháp `->` giả định trong JavaScript tương lai) có cú pháp ngắn hơn so với biểu thức hàm và không có [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments), [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super), hay [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) của riêng nó. Hàm mũi tên luôn là ẩn danh.

Hai yếu tố ảnh hưởng đến việc giới thiệu hàm mũi tên: _hàm ngắn hơn_ và _không ràng buộc_ `this`.

### Hàm ngắn hơn

Trong một số mẫu lập trình hàm, hàm ngắn hơn được chào đón. So sánh:

```js
const a = ["Hydrogen", "Helium", "Lithium", "Beryllium"];

const a2 = a.map(function (s) {
  return s.length;
});

console.log(a2); // [8, 6, 7, 9]

const a3 = a.map((s) => s.length);

console.log(a3); // [8, 6, 7, 9]
```

### Không có this riêng

Cho đến hàm mũi tên, mỗi hàm mới được định nghĩa đều xác định giá trị [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) của riêng nó (một object mới trong trường hợp constructor, undefined trong lời gọi hàm [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), object cơ sở nếu hàm được gọi như "method của object", v.v.). Điều này tỏ ra không lý tưởng với phong cách lập trình hướng đối tượng.

```js
function Person() {
  // The Person() constructor defines `this` as itself.
  this.age = 0;

  setInterval(function growUp() {
    // In nonstrict mode, the growUp() function defines `this`
    // as the global object, which is different from the `this`
    // defined by the Person() constructor.
    this.age++;
  }, 1000);
}

const p = new Person();
```

Trong ECMAScript 3/5, vấn đề này được giải quyết bằng cách gán giá trị trong `this` cho một biến có thể được đóng gói.

```js
function Person() {
  // Some choose `that` instead of `self`.
  // Choose one and be consistent.
  const self = this;
  self.age = 0;

  setInterval(function growUp() {
    // The callback refers to the `self` variable of which
    // the value is the expected object.
    self.age++;
  }, 1000);
}
```

Ngoài ra, có thể tạo một [hàm ràng buộc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) để giá trị `this` đúng sẽ được truyền vào hàm `growUp()`.

Hàm mũi tên không có `this` của riêng nó; giá trị `this` của ngữ cảnh thực thi bao quanh được sử dụng. Do đó, trong code sau, `this` trong hàm được truyền vào `setInterval` có cùng giá trị với `this` trong hàm bao quanh:

```js
function Person() {
  this.age = 0;

  setInterval(() => {
    this.age++; // `this` properly refers to the person object
  }, 1000);
}

const p = new Person();
```

{{PreviousNext("Web/JavaScript/Guide/Loops_and_iteration", "Web/JavaScript/Guide/Expressions_and_operators")}}
