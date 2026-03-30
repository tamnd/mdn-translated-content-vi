---
title: Lập trình hướng đối tượng
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Lập trình hướng đối tượng (OOP) là một mô hình lập trình cơ bản của nhiều ngôn ngữ lập trình, bao gồm Java và C++. Trong bài viết này, chúng ta sẽ cung cấp tổng quan về các khái niệm cơ bản của OOP. Chúng ta sẽ mô tả ba khái niệm chính: **lớp và thực thể**, **kế thừa** và **đóng gói**. Hiện tại, chúng ta sẽ mô tả các khái niệm này mà không liên quan đến JavaScript cụ thể, vì vậy tất cả các ví dụ được đưa ra bằng {{Glossary("Pseudocode", "pseudocode")}}.

> [!NOTE]
> Để chính xác, các tính năng được mô tả ở đây là của một phong cách OOP cụ thể được gọi là **dựa trên lớp** hay OOP "cổ điển". Khi mọi người nói về OOP, đây thường là kiểu họ muốn nói đến.

Sau đó, trong JavaScript, chúng ta sẽ xem xét cách hàm khởi tạo và chuỗi nguyên mẫu liên quan đến các khái niệm OOP này, và chúng khác nhau như thế nào. Trong bài viết tiếp theo, chúng ta sẽ xem xét một số tính năng bổ sung của JavaScript giúp triển khai các chương trình hướng đối tượng dễ dàng hơn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các kiến thức cơ bản về JavaScript
        (đặc biệt là
        <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">Kiến thức cơ bản về đối tượng</a>) và các khái niệm JavaScript hướng đối tượng được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các khái niệm lập trình hướng đối tượng (OOP): Lớp, thực thể, kế thừa và đóng gói.</li>
          <li>Cách các khái niệm OOP này áp dụng cho JavaScript, và sự khác biệt giữa nó với các ngôn ngữ như Java hoặc C++ là gì.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Lập trình hướng đối tượng là về việc mô hình hóa một hệ thống như một tập hợp các đối tượng, trong đó mỗi đối tượng đại diện cho một khía cạnh cụ thể của hệ thống. Các đối tượng chứa cả hàm (hoặc phương thức) và dữ liệu. Một đối tượng cung cấp giao diện công khai cho code khác muốn sử dụng nó nhưng duy trì trạng thái nội bộ riêng tư của riêng nó; các phần khác của hệ thống không cần quan tâm điều gì đang xảy ra bên trong đối tượng.

## Lớp và thực thể

Khi chúng ta mô hình hóa một vấn đề theo các đối tượng trong OOP, chúng ta tạo ra các định nghĩa trừu tượng đại diện cho các loại đối tượng chúng ta muốn có trong hệ thống. Ví dụ, nếu chúng ta mô hình hóa một trường học, chúng ta có thể muốn có các đối tượng đại diện cho giáo sư. Mỗi giáo sư có một số thuộc tính chung: tất cả đều có tên và môn học họ dạy. Ngoài ra, mỗi giáo sư đều có thể làm một số việc nhất định: họ đều có thể chấm bài và tự giới thiệu với sinh viên vào đầu năm, ví dụ.

Vì vậy `Professor` có thể là một **lớp** trong hệ thống của chúng ta. Định nghĩa của lớp liệt kê dữ liệu và phương thức mà mỗi giáo sư có.

Trong pseudocode, lớp `Professor` có thể được viết như sau:

```plain
class Professor
    properties
        name
        teaches
    methods
        grade(paper)
        introduceSelf()
```

Điều này định nghĩa lớp `Professor` với:

- hai thuộc tính dữ liệu: `name` và `teaches`
- hai phương thức: `grade()` để chấm bài và `introduceSelf()` để tự giới thiệu.

Bản thân lớp không làm gì cả: đây là một loại mẫu để tạo các đối tượng cụ thể của loại đó. Mỗi giáo sư cụ thể chúng ta tạo ra được gọi là một **thực thể** (instance) của lớp `Professor`. Quá trình tạo thực thể được thực hiện bởi một hàm đặc biệt gọi là **hàm khởi tạo** (constructor). Chúng ta truyền các giá trị vào hàm khởi tạo cho bất kỳ trạng thái nội bộ nào mà chúng ta muốn khởi tạo trong thực thể mới.

Nói chung, hàm khởi tạo được viết như một phần của định nghĩa lớp, và nó thường có cùng tên với lớp đó:

```plain
class Professor
    properties
        name
        teaches
    constructor
        Professor(name, teaches)
    methods
        grade(paper)
        introduceSelf()
```

Hàm khởi tạo này nhận hai tham số, vì vậy chúng ta có thể khởi tạo các thuộc tính `name` và `teaches` khi chúng ta tạo một giáo sư cụ thể mới.

Bây giờ chúng ta đã có hàm khởi tạo, chúng ta có thể tạo một số giáo sư. Các ngôn ngữ lập trình thường sử dụng từ khóa `new` để báo hiệu rằng hàm khởi tạo đang được gọi.

```js
walsh = new Professor("Walsh", "Psychology");
lillian = new Professor("Lillian", "Poetry");

walsh.teaches; // 'Psychology'
walsh.introduceSelf(); // 'My name is Professor Walsh and I will be your Psychology professor.'

lillian.teaches; // 'Poetry'
lillian.introduceSelf(); // 'My name is Professor Lillian and I will be your Poetry professor.'
```

Điều này tạo ra hai đối tượng, cả hai đều là thực thể của lớp `Professor`.

## Kế thừa

Giả sử trong trường học, chúng ta cũng muốn đại diện cho sinh viên. Không giống như giáo sư, sinh viên không thể chấm bài, không dạy một môn học cụ thể, và thuộc về một năm học cụ thể.

Tuy nhiên, sinh viên có tên và cũng có thể muốn tự giới thiệu, vì vậy chúng ta có thể viết định nghĩa lớp sinh viên như sau:

```plain
class Student
    properties
        name
        year
    constructor
        Student(name, year)
    methods
        introduceSelf()
```

Sẽ rất hữu ích nếu chúng ta có thể thể hiện thực tế rằng sinh viên và giáo sư chia sẻ một số thuộc tính, hay chính xác hơn, thực tế là ở một mức độ nào đó, họ là _cùng loại thứ_. **Kế thừa** cho phép chúng ta làm điều này.

Chúng ta bắt đầu bằng cách quan sát rằng sinh viên và giáo sư đều là người, và người có tên và muốn tự giới thiệu. Chúng ta có thể mô hình hóa điều này bằng cách định nghĩa một lớp mới `Person`, trong đó chúng ta định nghĩa tất cả các thuộc tính chung của người. Sau đó, cả `Professor` và `Student` đều có thể **kế thừa** từ `Person`, thêm các thuộc tính bổ sung của chúng:

```plain
class Person
    properties
        name
    constructor
        Person(name)
    methods
        introduceSelf()

class Professor : extends Person
    properties
        teaches
    constructor
        Professor(name, teaches)
    methods
        grade(paper)
        introduceSelf()

class Student : extends Person
    properties
        year
    constructor
        Student(name, year)
    methods
        introduceSelf()
```

Trong trường hợp này, chúng ta nói rằng `Person` là **lớp cha** (superclass hoặc parent class) của cả `Professor` và `Student`. Ngược lại, `Professor` và `Student` là **lớp con** (subclasses hoặc child classes) của `Person`.

Bạn có thể nhận thấy rằng `introduceSelf()` được định nghĩa trong cả ba lớp. Lý do cho điều này là trong khi tất cả mọi người đều muốn tự giới thiệu, cách họ làm điều đó là khác nhau:

```js
walsh = new Professor("Walsh", "Psychology");
walsh.introduceSelf(); // 'My name is Professor Walsh and I will be your Psychology professor.'

summers = new Student("Summers", 1);
summers.introduceSelf(); // 'My name is Summers and I'm in the first year.'
```

Chúng ta có thể có một triển khai mặc định của `introduceSelf()` cho những người không phải là sinh viên _hoặc_ giáo sư:

```js
pratt = new Person("Pratt");
pratt.introduceSelf(); // 'My name is Pratt.'
```

Tính năng này — khi một phương thức có cùng tên nhưng có triển khai khác nhau trong các lớp khác nhau — được gọi là **đa hình** (polymorphism). Khi một phương thức trong lớp con thay thế triển khai của lớp cha, chúng ta nói rằng lớp con **ghi đè** (overrides) phiên bản trong lớp cha.

## Đóng gói

Các đối tượng cung cấp giao diện cho code khác muốn sử dụng chúng nhưng duy trì trạng thái nội bộ của chính chúng. Trạng thái nội bộ của đối tượng được giữ **riêng tư** (private), nghĩa là nó chỉ có thể được truy cập bởi các phương thức của đối tượng đó, không phải từ các đối tượng khác. Giữ trạng thái nội bộ của đối tượng riêng tư, và nói chung tạo ra sự phân chia rõ ràng giữa giao diện công khai và trạng thái nội bộ riêng tư, được gọi là **đóng gói** (encapsulation).

Đây là một tính năng hữu ích vì nó cho phép lập trình viên thay đổi việc triển khai nội bộ của đối tượng mà không cần tìm và cập nhật tất cả code sử dụng nó: nó tạo ra một loại tường lửa giữa đối tượng này và phần còn lại của hệ thống.

Ví dụ, giả sử sinh viên được phép học bắn cung nếu họ đang ở năm thứ hai trở lên. Chúng ta có thể triển khai điều này chỉ bằng cách hiển thị thuộc tính `year` của sinh viên, và code khác có thể kiểm tra điều đó để quyết định xem sinh viên có thể tham gia khóa học hay không:

```js
if (student.year > 1) {
  // allow the student into the class
}
```

Vấn đề là, nếu chúng ta quyết định thay đổi tiêu chí cho phép sinh viên học bắn cung — ví dụ bằng cách yêu cầu cha mẹ hoặc người giám hộ cho phép — chúng ta sẽ cần cập nhật mọi nơi trong hệ thống thực hiện kiểm tra này. Sẽ tốt hơn nếu có một phương thức `canStudyArchery()` trên các đối tượng `Student`, triển khai logic ở một nơi:

```plain
class Student : extends Person
    properties
       year
    constructor
       Student(name, year)
    methods
       introduceSelf()
       canStudyArchery() { return this.year > 1 }
```

```js
if (student.canStudyArchery()) {
  // allow the student into the class
}
```

Bằng cách đó, nếu chúng ta muốn thay đổi các quy tắc về học bắn cung, chúng ta chỉ cần cập nhật lớp `Student`, và tất cả code sử dụng nó vẫn sẽ hoạt động.

Trong nhiều ngôn ngữ OOP, chúng ta có thể ngăn code khác truy cập trạng thái nội bộ của đối tượng bằng cách đánh dấu một số thuộc tính là `private`. Điều này sẽ tạo ra lỗi nếu code bên ngoài đối tượng cố gắng truy cập chúng:

```plain
class Student : extends Person
    properties
       private year
    constructor
        Student(name, year)
    methods
       introduceSelf()
       canStudyArchery() { return this.year > 1 }

student = new Student('Weber', 1)
student.year // error: 'year' is a private property of Student
```

Trong các ngôn ngữ không thực thi quyền truy cập như thế này, lập trình viên sử dụng các quy ước đặt tên, chẳng hạn như bắt đầu tên bằng dấu gạch dưới, để chỉ ra rằng thuộc tính nên được coi là riêng tư.

## OOP và JavaScript

Trong bài viết này, chúng ta đã mô tả một số tính năng cơ bản của lập trình hướng đối tượng dựa trên lớp được triển khai trong các ngôn ngữ như Java và C++.

Trong hai bài viết trước, chúng ta đã xem xét một vài tính năng cốt lõi của JavaScript: [hàm khởi tạo](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics) và [nguyên mẫu](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes). Các tính năng này chắc chắn có một số mối quan hệ với một số khái niệm OOP được mô tả ở trên.

- **Hàm khởi tạo** trong JavaScript cung cấp cho chúng ta thứ gì đó giống như định nghĩa lớp, cho phép chúng ta định nghĩa "hình dạng" của một đối tượng, bao gồm bất kỳ phương thức nào nó chứa, ở một nơi. Nhưng nguyên mẫu cũng có thể được sử dụng ở đây. Ví dụ, nếu một phương thức được định nghĩa trên thuộc tính `prototype` của hàm khởi tạo, thì tất cả các đối tượng được tạo bằng hàm khởi tạo đó đều nhận được phương thức đó qua nguyên mẫu của chúng, và chúng ta không cần định nghĩa nó trong hàm khởi tạo.

- **Chuỗi nguyên mẫu** có vẻ như là một cách tự nhiên để triển khai kế thừa. Ví dụ, nếu chúng ta có thể có một đối tượng `Student` có nguyên mẫu là `Person`, thì nó có thể kế thừa `name` và ghi đè `introduceSelf()`.

Nhưng đáng để hiểu sự khác biệt giữa các tính năng này và các khái niệm OOP "cổ điển" được mô tả ở trên. Chúng ta sẽ nêu bật một vài trong số chúng ở đây.

Đầu tiên, trong OOP dựa trên lớp, lớp và đối tượng là hai cấu trúc riêng biệt, và các đối tượng luôn được tạo ra như các thực thể của lớp. Ngoài ra, có sự phân biệt giữa tính năng dùng để định nghĩa lớp (cú pháp lớp bản thân) và tính năng dùng để khởi tạo đối tượng (hàm khởi tạo). Trong JavaScript, chúng ta có thể và thường tạo các đối tượng mà không cần bất kỳ định nghĩa lớp riêng biệt nào, bằng cách sử dụng hàm hoặc đối tượng literal. Điều này có thể làm cho việc làm việc với các đối tượng nhẹ hơn nhiều so với OOP cổ điển.

Thứ hai, mặc dù chuỗi nguyên mẫu trông giống như một hệ thống phân cấp kế thừa và hoạt động như nó theo một số cách, nhưng nó khác nhau theo những cách khác. Khi một lớp con được khởi tạo, một đối tượng duy nhất được tạo kết hợp các thuộc tính được định nghĩa trong lớp con với các thuộc tính được định nghĩa cao hơn trong hệ thống phân cấp. Với việc sử dụng nguyên mẫu, mỗi cấp của hệ thống phân cấp được biểu diễn bởi một đối tượng riêng biệt, và chúng được liên kết với nhau thông qua thuộc tính `__proto__`. Hành vi của chuỗi nguyên mẫu ít giống kế thừa hơn và giống **ủy quyền** (delegation) hơn. Ủy quyền là một mẫu lập trình trong đó một đối tượng, khi được yêu cầu thực hiện một nhiệm vụ, có thể tự thực hiện nhiệm vụ đó hoặc yêu cầu một đối tượng khác (đại diện của nó) thực hiện nhiệm vụ thay mặt cho nó. Theo nhiều cách, ủy quyền là cách kết hợp đối tượng linh hoạt hơn so với kế thừa (một điều trong số đó, có thể thay đổi hoặc thay thế hoàn toàn người được ủy quyền vào lúc chạy).

Có nói vậy, hàm khởi tạo và nguyên mẫu có thể được sử dụng để triển khai các mẫu OOP dựa trên lớp trong JavaScript. Nhưng sử dụng chúng trực tiếp để triển khai các tính năng như kế thừa thì phức tạp, vì vậy JavaScript cung cấp các tính năng bổ sung, được xây dựng trên mô hình nguyên mẫu, ánh xạ trực tiếp hơn với các khái niệm của OOP dựa trên lớp. Các tính năng bổ sung này là chủ đề của bài viết tiếp theo.

## Tóm tắt

Bài viết này đã mô tả các tính năng cơ bản của lập trình hướng đối tượng dựa trên lớp, và xem xét ngắn gọn cách hàm khởi tạo và nguyên mẫu JavaScript so sánh với các khái niệm này.

Trong bài viết tiếp theo, chúng ta sẽ xem xét các tính năng JavaScript cung cấp để hỗ trợ lập trình hướng đối tượng dựa trên lớp.

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
