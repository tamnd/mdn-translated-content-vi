---
title: "Kiểm tra kỹ năng: Biểu mẫu và nút"
short-title: "Kiểm tra: Biểu mẫu và nút"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/Forms_and_buttons
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_forms", "Learn_web_development/Core/Structuring_content/Forms_challenge", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách [biểu mẫu và nút HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_forms) hoạt động hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Biểu mẫu và nút 1

Bài tập này bắt đầu với một thách thức nhẹ nhàng bằng cách yêu cầu bạn tạo hai phần tử `<input>`, cho ID người dùng và mật khẩu, cùng với nút gửi.

Để hoàn thành bài tập:

1. Tạo các đầu vào phù hợp cho ID người dùng và mật khẩu.
2. Bạn cũng nên liên kết chúng với nhãn văn bản của chúng về mặt ngữ nghĩa.
3. Tạo nút gửi bên trong mục danh sách còn lại, với văn bản nút là "Log in".

<!-- Code shared across examples -->

```css hidden live-sample___forms-buttons-1 live-sample___forms-buttons-2 live-sample___forms-buttons-3 live-sample___forms-buttons-4 live-sample___forms-buttons-5 live-sample___forms-buttons-6 live-sample___forms-buttons-1-finished live-sample___forms-buttons-2-finished live-sample___forms-buttons-3-finished live-sample___forms-buttons-4-finished live-sample___forms-buttons-5-finished live-sample___forms-buttons-6-finished
body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0;
}

* {
  box-sizing: border-box;
}
```

<!-- Example-specific code -->

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-1", "100%", 150) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-1
<form>
  <ul>
    <li>User ID</li>
    <li>Password</li>
    <li></li>
  </ul>
</form>
```

Biểu mẫu được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("forms-buttons-1-finished", "100%", 150) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-1-finished
<form>
  <ul>
    <li>
      <label for="uid">User ID</label>
      <input type="text" id="uid" name="uid" />
    </li>
    <li>
      <label for="pwd">Password</label>
      <input type="password" id="pwd" name="pwd" />
    </li>
    <li>
      <button>Log in</button>
    </li>
  </ul>
</form>
```

</details>

## Biểu mẫu và nút 2

Bài tập tiếp theo yêu cầu bạn tạo các tập hợp hộp kiểm và nút radio hoạt động được, từ các nhãn văn bản được cung cấp.

Để hoàn thành bài tập:

1. Chuyển nội dung `<fieldset>` đầu tiên thành tập hợp các nút radio — bạn chỉ có thể chọn một nhân vật pony tại một thời điểm.
2. Đặt nút radio đầu tiên được chọn khi tải trang.
3. Chuyển nội dung `<fieldset>` thứ hai thành tập hợp hộp kiểm.
4. Thêm một vài lựa chọn hotdog của riêng bạn.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-2", "100%", 350) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-2
<form>
  <fieldset>
    <legend>Who is your favorite pony?</legend>
    <ul>
      <li>
        <label for="pinkie">Pinkie Pie</label>
      </li>
      <li>
        <label for="rainbow">Rainbow Dash</label>
      </li>
      <li>
        <label for="twilight">Twilight Sparkle</label>
      </li>
    </ul>
  </fieldset>
  <fieldset>
    <legend>Hotdog preferences</legend>
    <ul>
      <li>
        <label for="vegan">Vegan</label>
      </li>
      <li>
        <label for="onions">Onions</label>
      </li>
    </ul>
  </fieldset>
  <button>Submit</button>
</form>
```

Biểu mẫu được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("forms-buttons-2-finished", "100%", 360) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-2-finished
<form>
  <fieldset>
    <legend>Who is your favorite pony?</legend>
    <ul>
      <li>
        <label for="pinkie">Pinkie Pie</label>
        <input type="radio" id="pinkie" name="pony" value="pinkie" checked />
      </li>
      <li>
        <label for="rainbow">Rainbow Dash</label>
        <input type="radio" id="rainbow" name="pony" value="rainbow" />
      </li>
      <li>
        <label for="twilight">Twilight Sparkle</label>
        <input type="radio" id="twilight" name="pony" value="twilight" />
      </li>
    </ul>
  </fieldset>
  <fieldset>
    <legend>Hotdog preferences</legend>
    <ul>
      <li>
        <label for="vegan">Vegan</label>
        <input type="checkbox" id="vegan" name="hotdog" value="vegan" />
      </li>
      <li>
        <label for="onions">Onions</label>
        <input type="checkbox" id="onions" name="hotdog" value="onions" />
      </li>
      <li>
        <label for="mustard">Mustard</label>
        <input type="checkbox" id="mustard" name="hotdog" value="mustard" />
      </li>

      <li>
        <label for="ketchup">Ketchup</label>
        <input type="checkbox" id="ketchup" name="hotdog" value="ketchup" />
      </li>
    </ul>
  </fieldset>
  <button>Submit</button>
</form>
```

</details>

## Biểu mẫu và nút 3

Trong bài tập này, bạn sẽ khám phá một số loại đầu vào cụ thể hơn. Chúng tôi muốn bạn tạo các đầu vào phù hợp để người dùng cập nhật thông tin của họ cho:

1. Email
2. Website
3. Số điện thoại
4. Màu yêu thích

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-3", "100%", 250) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-3
<form>
  <h2>Edit your preferences</h2>
  <ul>
    <li>
      <label for="email">Email</label>
    </li>
    <li>
      <label for="website">Website</label>
    </li>
    <li>
      <label for="phone">Phone number</label>
    </li>
    <li>
      <label for="fave-color">Favorite color</label>
    </li>
    <li>
      <button>Update preferences</button>
    </li>
  </ul>
</form>
```

Biểu mẫu được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("forms-buttons-3-finished", "100%", 250) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-3-finished
<form>
  <h2>Edit your preferences</h2>
  <ul>
    <li>
      <label for="email">Email</label>
      <input type="email" id="email" name="email" />
    </li>
    <li>
      <label for="website">Website</label>
      <input type="url" id="website" name="website" />
    </li>
    <li>
      <label for="phone">Phone number</label>
      <input type="tel" id="phone" name="phone" />
    </li>
    <li>
      <label for="fave-color">Favorite color</label>
      <input type="color" id="fave-color" name="fave-color" />
    </li>
    <li>
      <button>Update preferences</button>
    </li>
  </ul>
</form>
```

</details>

## Biểu mẫu và nút 4

Bây giờ đến lúc thử triển khai menu chọn thả xuống, để cho phép người dùng chọn món ăn yêu thích từ các lựa chọn được cung cấp.

Để hoàn thành bài tập:

1. Tạo cấu trúc hộp chọn cơ bản.
2. Liên kết nó về mặt ngữ nghĩa với nhãn "food" được cung cấp.
3. Bên trong danh sách, chia các lựa chọn thành 2 nhóm con — "mains" (món chính) và "snacks" (đồ ăn vặt).

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-4", "100%", 120) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-4
<form>
  <ul>
    <li>
      <label for="food">Pick your favorite food:</label>

      Salad Curry Pizza Fajitas Biscuits Crisps Fruit Breadsticks
    </li>
    <li>
      <button>Submit choice</button>
    </li>
  </ul>
</form>
```

Biểu mẫu được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("forms-buttons-4-finished", "100%", 120) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-4-finished
<form>
  <ul>
    <li>
      <label for="food">Pick your favorite food:</label>
      <select name="food" id="food">
        <optgroup label="mains">
          <option>Salad</option>
          <option>Curry</option>
          <option>Pizza</option>
          <option>Fajitas</option>
        </optgroup>
        <optgroup label="snacks">
          <option>Biscuits</option>
          <option>Crisps</option>
          <option>Fruit</option>
          <option>Breadsticks</option>
        </optgroup>
      </select>
    </li>
    <li>
      <button>Submit choice</button>
    </li>
  </ul>
</form>
```

</details>

## Biểu mẫu và nút 5

Trong bài tập này, chúng tôi muốn bạn cấu trúc các tính năng biểu mẫu được cung cấp.

Để hoàn thành bài tập:

1. Tách hai trường biểu mẫu đầu tiên và hai trường tiếp theo vào hai vùng chứa riêng biệt, mỗi vùng có chú thích mô tả (sử dụng "Personal details" cho hai trường đầu tiên, và "Comment information" cho hai trường tiếp theo).
2. Đánh dấu mỗi nhãn văn bản với phần tử phù hợp để nó được liên kết ngữ nghĩa với trường biểu mẫu tương ứng.
3. Thêm tập hợp phần tử cấu trúc phù hợp xung quanh các cặp nhãn/trường để tách chúng ra.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-5", "100%", 120) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-5
<form>
  Name:
  <input type="text" id="name" name="name" />

  Age:
  <input type="number" id="age" name="age" />

  Comment:
  <input type="text" id="comment" name="comment" />

  Email:
  <input type="email" id="email" name="email" />
</form>
```

Biểu mẫu được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("forms-buttons-5-finished", "100%", 300) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-5-finished
<form>
  <fieldset>
    <legend>Personal details</legend>
    <ul>
      <li>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" />
      </li>
      <li>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" />
      </li>
    </ul>
  </fieldset>
  <fieldset>
    <legend>Comment information</legend>
    <ul>
      <li>
        <label for="comment">Comment:</label>
        <input type="text" id="comment" name="comment" />
      </li>
      <li>
        <label for="email">Email (include if you want a reply):</label>
        <input type="email" id="email" name="email" />
      </li>
    </ul>
  </fieldset>
</form>
```

</details>

## Biểu mẫu và nút 6

Trong bài tập này, chúng tôi cung cấp cho bạn một biểu mẫu hỗ trợ đơn giản, và chúng tôi muốn bạn thêm một số tính năng xác thực vào đó. Bài tập này đòi hỏi một số kiến thức mà chúng tôi không dạy trong bài viết "Biểu mẫu và nút trong HTML", vì vậy bạn có thể cần nghiên cứu ở nơi khác.

Để hoàn thành bài tập:

1. Đặt tất cả các trường đầu vào là bắt buộc phải điền trước khi biểu mẫu có thể được gửi.
2. Thay đổi loại của trường "Email address" và "Phone number" để trình duyệt áp dụng một số xác thực cụ thể hơn phù hợp với dữ liệu được yêu cầu.
3. Cung cấp cho trường "User name" độ dài bắt buộc từ 5 đến 20 ký tự, trường "Phone number" độ dài tối đa 15 ký tự, và trường "Comment" độ dài tối đa 200 ký tự.

Hãy thử gửi biểu mẫu của bạn — nó sẽ từ chối gửi cho đến khi các ràng buộc trên được tuân thủ, và đưa ra thông báo lỗi phù hợp.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample("forms-buttons-6", "100%", 300) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___forms-buttons-6
<form>
  <h2>Enter your support query</h2>
  <ul>
    <li>
      <label for="uname">User name:</label>
      <input type="text" name="uname" id="uname" />
    </li>
    <li>
      <label for="email">Email address:</label>
      <input type="text" name="email" id="email" />
    </li>
    <li>
      <label for="phone">Phone number:</label>
      <input type="text" name="phone" id="phone" />
    </li>
    <li>
      <label for="comment">Comment:</label>
      <textarea name="comment" id="comment"> </textarea>
    </li>
    <li>
      <button>Submit comment</button>
    </li>
  </ul>
</form>
```

Chúng tôi không cung cấp nội dung hoàn chỉnh cho bài tập này, vì nó trông giống với điểm xuất phát.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___forms-buttons-6-finished
<form>
  <h2>Enter your support query</h2>
  <ul>
    <li>
      <label for="uname">User name:</label>
      <input
        type="text"
        name="uname"
        id="uname"
        required
        minlength="5"
        maxlength="20" />
    </li>
    <li>
      <label for="email">Email address:</label>
      <input type="email" name="email" id="email" required />
    </li>
    <li>
      <label for="phone">Phone number:</label>
      <input type="tel" name="phone" id="phone" required maxlength="15" />
    </li>
    <li>
      <label for="comment">Comment:</label>
      <textarea name="comment" id="comment" required maxlength="200"></textarea>
    </li>
    <li>
      <button>Submit comment</button>
    </li>
  </ul>
</form>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_forms", "Learn_web_development/Core/Structuring_content/Forms_challenge", "Learn_web_development/Core/Structuring_content")}}
