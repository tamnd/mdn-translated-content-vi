---
title: Kiến thức cơ bản về đối tượng JavaScript
short-title: Đối tượng
slug: Learn_web_development/Core/Scripting/Object_basics
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Events","Learn_web_development/Core/Scripting/Test_your_skills/Object_basics", "Learn_web_development/Core/Scripting")}}

Trong bài viết này, chúng ta sẽ xem xét cú pháp đối tượng JavaScript cơ bản, và xem lại một số tính năng JavaScript mà chúng ta đã thấy trước đó trong khóa học, nhắc lại rằng nhiều tính năng bạn đã xử lý đều là các đối tượng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">kiến thức cơ bản về CSS</a>, quen thuộc với kiến thức cơ bản về JavaScript như đã trình bày trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu rằng trong JavaScript hầu hết mọi thứ đều là đối tượng, và bạn có thể đã sử dụng đối tượng mỗi khi bạn đụng vào JavaScript.</li>
          <li>Cú pháp cơ bản: Object literal, thuộc tính và phương thức, lồng đối tượng và mảng trong đối tượng.</li>
          <li>Sử dụng hàm tạo để tạo đối tượng mới.</li>
          <li>Phạm vi đối tượng và <code>this</code>.</li>
          <li>Truy cập thuộc tính và phương thức — cú pháp ngoặc và dấu chấm.</li>
        <ul>
      </td>
    </tr>
  </tbody>
</table>

## Kiến thức cơ bản về đối tượng

Một đối tượng là tập hợp các dữ liệu và/hoặc chức năng liên quan.
Chúng thường bao gồm một số biến và hàm (được gọi là thuộc tính và phương thức khi chúng nằm bên trong đối tượng).
Hãy làm việc qua một ví dụ để hiểu chúng trông như thế nào.

Để bắt đầu, hãy tạo bản sao cục bộ của tệp [oojs.html](https://github.com/mdn/learning-area/blob/main/javascript/oojs/introduction/oojs.html) của chúng ta. Tệp này chứa rất ít — phần tử {{HTMLElement("script")}} để chúng ta viết mã nguồn vào. Chúng ta sẽ sử dụng điều này như cơ sở để khám phá cú pháp đối tượng cơ bản. Trong khi làm việc với ví dụ này, bạn nên có [bảng điều khiển JavaScript của công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools#the_javascript_console) mở và sẵn sàng để nhập một số lệnh.

Như với nhiều thứ trong JavaScript, việc tạo đối tượng thường bắt đầu bằng cách định nghĩa và khởi tạo một biến. Hãy thử nhập dòng sau bên dưới mã JavaScript đã có trong tệp của bạn, sau đó lưu và làm mới:

```js
const person = {};
```

Bây giờ hãy mở [bảng điều khiển JavaScript](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools#the_javascript_console) của trình duyệt, nhập `person` vào nó và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>. Bạn sẽ nhận được kết quả tương tự với một trong các dòng dưới đây:

```plain
[object Object]
Object { }
{ }
```

Xin chúc mừng, bạn vừa tạo đối tượng đầu tiên của mình. Xong rồi! Nhưng đây là đối tượng rỗng, vì vậy chúng ta không thực sự làm được nhiều với nó. Hãy cập nhật đối tượng JavaScript trong tệp của chúng ta để trông như thế này:

```js
const person = {
  name: ["Bob", "Smith"],
  age: 32,
  bio: function () {
    console.log(`${this.name[0]} ${this.name[1]} is ${this.age} years old.`);
  },
  introduceSelf: function () {
    console.log(`Hi! I'm ${this.name[0]}.`);
  },
};
```

Sau khi lưu và làm mới, hãy thử nhập một số dòng sau vào bảng điều khiển JavaScript trên devtools trình duyệt của bạn:

```js
person.name;
person.name[0];
person.age;
person.bio();
// "Bob Smith is 32 years old."
person.introduceSelf();
// "Hi! I'm Bob."
```

Bây giờ bạn đã có một số dữ liệu và chức năng bên trong đối tượng của mình, và bây giờ có thể truy cập chúng với một số cú pháp đơn giản đẹp đẽ!

Vậy điều gì đang xảy ra ở đây? Một đối tượng được tạo thành từ nhiều thành viên, mỗi thành viên có tên (ví dụ, `name` và `age` ở trên), và một giá trị (ví dụ, `['Bob', 'Smith']` và `32`). Mỗi cặp tên/giá trị phải được phân tách bằng dấu phẩy, và tên và giá trị trong mỗi trường hợp được phân tách bằng dấu hai chấm. Cú pháp luôn tuân theo mẫu này:

```js
const objectName = {
  member1Name: member1Value,
  member2Name: member2Value,
  member3Name: member3Value,
};
```

Giá trị của một thành viên đối tượng có thể là hầu như bất cứ thứ gì — trong đối tượng person của chúng ta, chúng ta có một số, một mảng và hai hàm. Hai mục đầu tiên là các mục dữ liệu và được gọi là **thuộc tính** của đối tượng. Hai mục cuối là các hàm cho phép đối tượng làm điều gì đó với dữ liệu đó, và được gọi là **phương thức** của đối tượng.

Khi các thành viên của đối tượng là hàm, có cú pháp đơn giản hơn. Thay vì `bio: function ()`, chúng ta có thể viết `bio()`. Như thế này:

```js
const person = {
  name: ["Bob", "Smith"],
  age: 32,
  bio() {
    console.log(`${this.name[0]} ${this.name[1]} is ${this.age} years old.`);
  },
  introduceSelf() {
    console.log(`Hi! I'm ${this.name[0]}.`);
  },
};
```

Từ bây giờ, chúng ta sẽ sử dụng cú pháp ngắn hơn này.

Đối tượng như thế này được gọi là **object literal** — chúng ta đã viết nội dung đối tượng theo nghĩa đen khi chúng ta đến để tạo nó. Điều này khác với các đối tượng được khởi tạo từ các lớp, mà chúng ta sẽ xem xét sau.

Việc tạo đối tượng bằng cách sử dụng object literal rất phổ biến khi bạn muốn chuyển một loạt các mục dữ liệu liên quan, có cấu trúc theo một cách nào đó, ví dụ gửi yêu cầu đến máy chủ để đưa vào cơ sở dữ liệu. Gửi một đối tượng đơn lẻ hiệu quả hơn nhiều so với gửi một số mục riêng lẻ, và dễ làm việc hơn so với mảng, khi bạn muốn xác định các mục riêng lẻ theo tên.

## Ký hiệu dấu chấm

Ở trên, bạn đã truy cập các thuộc tính và phương thức của đối tượng bằng **ký hiệu dấu chấm**. Tên đối tượng (person) đóng vai trò là **không gian tên** — nó phải được nhập trước để truy cập bất cứ thứ gì bên trong đối tượng. Tiếp theo bạn viết dấu chấm, sau đó là mục bạn muốn truy cập — đây có thể là tên của thuộc tính đơn giản, một mục của thuộc tính mảng, hoặc lời gọi đến một trong các phương thức của đối tượng, ví dụ:

```js
person.age;
person.bio();
```

### Đối tượng dưới dạng thuộc tính đối tượng

Một thuộc tính đối tượng có thể tự nó là một đối tượng. Ví dụ, hãy thử thay đổi thành viên `name` từ

```js
const person = {
  name: ["Bob", "Smith"],
};
```

thành

```js
const person = {
  name: {
    first: "Bob",
    last: "Smith",
  },
  // …
};
```

Để truy cập các mục này, bạn chỉ cần nối thêm bước thêm vào cuối với một dấu chấm khác. Hãy thử chúng trong bảng điều khiển JS:

```js
person.name.first;
person.name.last;
```

Nếu bạn làm điều này, bạn cũng sẽ cần phải xem qua mã phương thức của mình và thay đổi bất kỳ trường hợp nào của

```js
name[0];
name[1];
```

thành

```js
name.first;
name.last;
```

Nếu không, các phương thức của bạn sẽ không còn hoạt động nữa.

## Ký hiệu ngoặc

Ký hiệu ngoặc cung cấp cách thay thế để truy cập các thuộc tính đối tượng.
Thay vì sử dụng [ký hiệu dấu chấm](#dot_notation) như thế này:

```js
person.age;
person.name.first;
```

Bạn có thể sử dụng dấu ngoặc vuông thay thế:

```js
person["age"];
person["name"]["first"];
```

Điều này trông rất giống với cách bạn truy cập các mục trong mảng, và về cơ bản là điều tương tự — thay vì sử dụng số chỉ mục để chọn mục, bạn đang sử dụng tên liên kết với giá trị của mỗi thành viên.
Không có gì ngạc nhiên khi đối tượng đôi khi được gọi là **mảng kết hợp** — chúng ánh xạ chuỗi đến giá trị theo cách tương tự như mảng ánh xạ số đến giá trị.

Ký hiệu dấu chấm thường được ưa thích hơn ký hiệu ngoặc vì nó ngắn gọn và dễ đọc hơn.
Tuy nhiên có một số trường hợp bạn phải sử dụng dấu ngoặc vuông.
Ví dụ, nếu tên thuộc tính đối tượng được lưu trong biến, thì bạn không thể sử dụng ký hiệu dấu chấm để truy cập giá trị, nhưng bạn có thể truy cập giá trị bằng ký hiệu ngoặc.

Trong ví dụ dưới đây, hàm `logProperty()` có thể sử dụng `person[propertyName]` để lấy giá trị của thuộc tính có tên trong `propertyName`.

```js
const person = {
  name: ["Bob", "Smith"],
  age: 32,
};

function logProperty(propertyName) {
  console.log(person[propertyName]);
}

logProperty("name");
// ["Bob", "Smith"]
logProperty("age");
// 32
```

## Thiết lập thành viên đối tượng

Cho đến nay chúng ta chỉ xem xét việc lấy (hoặc **lấy**) thành viên đối tượng — bạn cũng có thể **thiết lập** (cập nhật) giá trị của thành viên đối tượng bằng cách khai báo thành viên bạn muốn thiết lập (sử dụng ký hiệu dấu chấm hoặc ngoặc), như thế này:

```js
person.age = 45;
person["name"]["last"] = "Cratchit";
```

Hãy thử nhập các dòng trên, sau đó lấy lại các thành viên để xem chúng đã thay đổi như thế nào, như sau:

```js
person.age;
person["name"]["last"];
```

Thiết lập thành viên không chỉ dừng lại ở việc cập nhật giá trị của các thuộc tính và phương thức hiện có; bạn cũng có thể tạo hoàn toàn các thành viên mới. Hãy thử các điều này trong bảng điều khiển JS:

```js
person["eyes"] = "hazel";
person.farewell = function () {
  console.log("Bye everybody!");
};
```

Bây giờ bạn có thể kiểm tra các thành viên mới của mình:

```js
person["eyes"];
person.farewell();
// "Bye everybody!"
```

Một khía cạnh hữu ích của ký hiệu ngoặc là nó có thể được sử dụng để thiết lập không chỉ giá trị thành viên một cách động, mà còn cả tên thành viên. Giả sử chúng ta muốn người dùng có thể lưu trữ các kiểu giá trị tùy chỉnh trong dữ liệu của họ, bằng cách nhập tên thành viên và giá trị vào hai đầu vào văn bản. Chúng ta có thể lấy những giá trị đó như thế này:

```js
const myDataName = nameInput.value;
const myDataValue = nameValue.value;
```

Sau đó chúng ta có thể thêm tên và giá trị thành viên mới này vào đối tượng `person` như thế này:

```js
person[myDataName] = myDataValue;
```

Để kiểm tra điều này, hãy thử thêm các dòng sau vào mã của bạn, ngay bên dưới dấu ngoặc nhọn đóng của đối tượng `person`:

```js
const myDataName = "height";
const myDataValue = "1.75m";
person[myDataName] = myDataValue;
```

Bây giờ hãy thử lưu và làm mới, và nhập nội dung sau vào đầu vào văn bản của bạn:

```js
person.height;
```

Thêm thuộc tính vào đối tượng bằng phương thức trên không thể thực hiện được với ký hiệu dấu chấm, chỉ có thể chấp nhận tên thành viên theo nghĩa đen, không phải giá trị biến trỏ đến tên.

## "this" là gì?

Bạn có thể đã nhận thấy điều gì đó hơi lạ trong các phương thức của chúng ta. Hãy xem cái này ví dụ:

```js
const person = {
  // …
  introduceSelf() {
    console.log(`Hi! I'm ${this.name[0]}.`);
  },
};
```

Bạn có thể đang tự hỏi "this" là gì. Từ khóa `this` thường đề cập đến đối tượng hiện tại mà mã đang được thực thi trong. Trong ngữ cảnh của phương thức đối tượng, `this` đề cập đến đối tượng mà phương thức được gọi trên.

Hãy minh họa ý nghĩa của chúng ta với một cặp đối tượng person được đơn giản hóa:

```js
const person1 = {
  name: "Chris",
  introduceSelf() {
    console.log(`Hi! I'm ${this.name}.`);
  },
};

const person2 = {
  name: "Deepti",
  introduceSelf() {
    console.log(`Hi! I'm ${this.name}.`);
  },
};
```

Trong trường hợp này, `person1.introduceSelf()` xuất ra "Hi! I'm Chris."; `person2.introduceSelf()` xuất ra "Hi! I'm Deepti." Điều này xảy ra vì khi phương thức được gọi, `this` đề cập đến đối tượng mà phương thức được gọi trên, điều này cho phép cùng một định nghĩa phương thức hoạt động cho nhiều đối tượng.

Điều này không thực sự hữu ích lắm khi bạn viết object literal bằng tay, vì sử dụng tên đối tượng (`person1` và `person2`) dẫn đến kết quả hoàn toàn giống nhau, nhưng nó sẽ thiết yếu khi chúng ta bắt đầu sử dụng **hàm tạo** để tạo nhiều hơn một đối tượng từ một định nghĩa đối tượng duy nhất, và đó là chủ đề của phần tiếp theo.

## Giới thiệu hàm tạo

Sử dụng object literal là ổn khi bạn chỉ cần tạo một đối tượng, nhưng nếu bạn phải tạo nhiều hơn một, như trong phần trước, chúng thực sự không đầy đủ. Chúng ta phải viết cùng một mã cho mỗi đối tượng chúng ta tạo, và nếu chúng ta muốn thay đổi một số thuộc tính của đối tượng - như thêm thuộc tính `height` - thì chúng ta phải nhớ cập nhật mỗi đối tượng.

Chúng ta muốn có cách định nghĩa "hình dạng" của đối tượng — tập hợp các phương thức và thuộc tính mà nó có thể có — và sau đó tạo bao nhiêu đối tượng tùy thích, chỉ cập nhật các giá trị cho các thuộc tính khác nhau.

Phiên bản đầu tiên của điều này chỉ là một hàm:

```js
function createPerson(name) {
  const obj = {};
  obj.name = name;
  obj.introduceSelf = function () {
    console.log(`Hi! I'm ${this.name}.`);
  };
  return obj;
}
```

Hàm này tạo và trả về đối tượng mới mỗi khi chúng ta gọi nó. Đối tượng sẽ có hai thành viên:

- thuộc tính `name`
- phương thức `introduceSelf()`.

Lưu ý rằng `createPerson()` nhận tham số `name` để thiết lập giá trị của thuộc tính `name`, nhưng giá trị của phương thức `introduceSelf()` sẽ giống nhau cho tất cả các đối tượng được tạo bằng hàm này. Đây là mẫu rất phổ biến để tạo đối tượng.

Bây giờ chúng ta có thể tạo bao nhiêu đối tượng tùy thích, tái sử dụng định nghĩa:

```js
const salva = createPerson("Salva");
salva.introduceSelf();
// "Hi! I'm Salva."

const frankie = createPerson("Frankie");
frankie.introduceSelf();
// "Hi! I'm Frankie."
```

Điều này hoạt động tốt nhưng hơi dài dòng: chúng ta phải tạo đối tượng rỗng, khởi tạo nó, và trả về nó. Cách tốt hơn là sử dụng **hàm tạo**. Hàm tạo chỉ là hàm được gọi bằng từ khóa {{jsxref("operators/new", "new")}}. Khi bạn gọi hàm tạo, nó sẽ:

- tạo một đối tượng mới
- gán `this` vào đối tượng mới, vì vậy bạn có thể tham chiếu `this` trong mã hàm tạo
- chạy mã trong hàm tạo
- trả về đối tượng mới.

Theo quy ước, hàm tạo bắt đầu bằng chữ hoa và được đặt tên theo loại đối tượng chúng tạo ra. Vì vậy chúng ta có thể viết lại ví dụ như thế này:

```js
function Person(name) {
  this.name = name;
  this.introduceSelf = function () {
    console.log(`Hi! I'm ${this.name}.`);
  };
}
```

Để gọi `Person()` như hàm tạo, chúng ta sử dụng `new`:

```js
const salva = new Person("Salva");
salva.introduceSelf();
// "Hi! I'm Salva."

const frankie = new Person("Frankie");
frankie.introduceSelf();
// "Hi! I'm Frankie."
```

## Bạn đã sử dụng đối tượng từ trước

Khi bạn đã đi qua các ví dụ này, bạn có thể đã nghĩ rằng ký hiệu dấu chấm bạn đã sử dụng rất quen thuộc. Đó là vì bạn đã sử dụng nó trong suốt khóa học! Mỗi khi chúng ta đã làm việc qua một ví dụ sử dụng API trình duyệt tích hợp sẵn hoặc đối tượng JavaScript, chúng ta đã sử dụng các đối tượng, vì những tính năng đó được xây dựng bằng cách sử dụng chính xác loại cấu trúc đối tượng giống nhau mà chúng ta đang xem xét ở đây, mặc dù phức tạp hơn những ví dụ cơ bản tùy chỉnh của chúng ta.

Vì vậy khi bạn sử dụng các phương thức chuỗi như:

```js
myString.split(",");
```

Bạn đã sử dụng phương thức có sẵn trên đối tượng [`String`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String). Mỗi khi bạn tạo một chuỗi trong mã, chuỗi đó sẽ tự động được tạo như một thực thể của `String`, và do đó có một số phương thức và thuộc tính chung có sẵn trên nó.

Khi bạn truy cập mô hình đối tượng tài liệu bằng các dòng như thế này:

```js
const myDiv = document.createElement("div");
const myVideo = document.querySelector("video");
```

Bạn đã sử dụng các phương thức có sẵn trên đối tượng [`Document`](/en-US/docs/Web/API/Document). Đối với mỗi trang web được tải, một thực thể của `Document` được tạo, gọi là `document`, đại diện cho toàn bộ cấu trúc, nội dung và các tính năng khác của trang như URL của nó. Một lần nữa, điều này có nghĩa là nó có một số phương thức và thuộc tính chung có sẵn trên nó.

Điều tương tự cũng đúng với hầu hết các đối tượng và API tích hợp sẵn khác mà bạn đã sử dụng — [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), [`Math`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math), v.v.

Lưu ý rằng các đối tượng và API tích hợp sẵn không phải lúc nào cũng tự động tạo thực thể đối tượng. Ví dụ, [Notifications API](/en-US/docs/Web/API/Notifications_API) — cho phép các trình duyệt hiện đại kích hoạt thông báo hệ thống — yêu cầu bạn khởi tạo một thực thể đối tượng mới bằng hàm tạo cho mỗi thông báo bạn muốn kích hoạt. Hãy thử nhập nội dung sau vào bảng điều khiển JavaScript của bạn:

```js
const myNotification = new Notification("Hello!");
```

## Tóm tắt

Bây giờ bạn nên có ý tưởng tốt về cách làm việc với các đối tượng trong JavaScript — bao gồm tạo các đối tượng đơn giản của riêng bạn. Bạn cũng nên đánh giá cao rằng các đối tượng rất hữu ích như các cấu trúc để lưu trữ dữ liệu và chức năng liên quan — nếu bạn cố gắng theo dõi tất cả các thuộc tính và phương thức trong đối tượng `person` của chúng ta như các biến và hàm riêng lẻ, sẽ không hiệu quả và gây bực bội, và chúng ta sẽ có nguy cơ xung đột với các biến và hàm khác có cùng tên. Các đối tượng cho phép chúng ta giữ thông tin được khóa an toàn trong gói riêng của chúng, tránh xa nguy hiểm.

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ tất cả thông tin này.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Events","Learn_web_development/Core/Scripting/Test_your_skills/Object_basics", "Learn_web_development/Core/Scripting")}}
