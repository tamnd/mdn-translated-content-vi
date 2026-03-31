---
title: Regular expression syntax cheat sheet
slug: Web/JavaScript/Guide/Regular_expressions/Cheatsheet
page-type: guide
sidebar: jssidebar
---

Trang này cung cấp bảng tóm tắt tổng quát về tất cả các tính năng của cú pháp `RegExp` bằng cách tổng hợp nội dung từ các bài viết trong hướng dẫn `RegExp`. Nếu bạn cần thêm thông tin về một chủ đề cụ thể, hãy theo dõi liên kết trên tiêu đề tương ứng để truy cập bài viết đầy đủ hoặc truy cập [hướng dẫn](/en-US/docs/Web/JavaScript/Guide/Regular_expressions).

## Lớp ký tự

[Lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) phân biệt các loại ký tự khác nhau, ví dụ như phân biệt chữ cái và chữ số.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code>[xyz]<br />[a-c]</code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class"><strong>Lớp ký tự:</strong></a>
          Khớp với bất kỳ ký tự nào trong dấu ngoặc vuông. Bạn có thể
          chỉ định một phạm vi ký tự bằng cách sử dụng dấu gạch ngang, nhưng nếu dấu gạch ngang
          xuất hiện là ký tự đầu tiên hoặc cuối cùng trong dấu ngoặc vuông,
          nó được coi là dấu gạch ngang thực sự để đưa vào lớp ký tự
          như một ký tự thông thường.
        </p>
        <p>
          Ví dụ, <code>[abcd]</code> giống như <code>[a-d]</code>.
          Chúng khớp với "b" trong "brisket" và "c" trong "chop".
        </p>
        <p>
          Ví dụ, <code>[abcd-]</code> và <code>[-abcd]</code> khớp với
          "b" trong "brisket", "c" trong "chop" và "-" (dấu gạch ngang) trong
          "non-profit".
        </p>
        <p>
          Ví dụ, <code>[\w-]</code> giống như
          <code>[A-Za-z0-9_-]</code>. Cả hai đều khớp với "b" trong "brisket",
          "c" trong "chop" và "n" trong "non-profit".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <code>[^xyz]<br />[^a-c]</code>
        </p>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class"><strong>Lớp ký tự phủ định:</strong></a>
          Khớp với bất kỳ thứ gì không nằm trong dấu ngoặc vuông. Bạn có thể chỉ định một phạm vi
          ký tự bằng cách sử dụng dấu gạch ngang, nhưng nếu dấu gạch ngang xuất hiện là
          ký tự đầu tiên sau <code>^</code> hoặc ký tự cuối cùng trong dấu ngoặc vuông, nó được coi là
          dấu gạch ngang thực sự để đưa vào lớp ký tự như một ký tự thông thường. Ví dụ, <code>[^abc]</code> giống như
          <code>[^a-c]</code>. Chúng ban đầu khớp với "o" trong "bacon" và "h" trong
          "chop".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Ký tự ^ cũng có thể chỉ ra
            <a
              href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions"
              >đầu đầu vào</a
            >.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>.</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard"><strong>Wildcard:</strong></a>
          Khớp với bất kỳ ký tự đơn nào <em>ngoại trừ</em> các ký tự kết thúc dòng:
          <code>\n</code>, <code>\r</code>, <code>\u2028</code> hoặc
          <code>\u2029</code>. Ví dụ, <code>/.y/</code> khớp với "my" và
          "ay", nhưng không khớp với "yes", trong "yes make my day", vì không có ký tự nào trước "y" trong "yes". Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll"><code>dotAll</code></a> (s) được bật, cũng khớp với các ký tự kết thúc dòng.
          Bên trong một lớp ký tự, dấu chấm mất đi ý nghĩa đặc biệt và
          khớp với dấu chấm thực sự.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\d</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự chữ số:</strong></a>
          Khớp với bất kỳ chữ số nào (số Ả Rập). Tương đương với <code>[0-9]</code>.
          Ví dụ, <code>/\d/</code> hoặc <code>/[0-9]/</code> khớp với "2" trong
          "B2 is the suite number".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\D</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự không phải chữ số:</strong></a>
          Khớp với bất kỳ ký tự nào không phải chữ số (số Ả Rập). Tương đương
          với <code>[^0-9]</code>. Ví dụ, <code>/\D/</code> hoặc
          <code>/[^0-9]/</code> khớp với "B" trong "B2 is the suite number".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\w</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự từ:</strong></a>
          Khớp với bất kỳ ký tự chữ và số nào từ bảng chữ cái Latin cơ bản,
          bao gồm cả dấu gạch dưới. Tương đương với <code>[A-Za-z0-9_]</code>. Ví dụ,
          <code>/\w/</code> khớp với "a" trong "apple", "5" trong "$5.28", "3"
          trong "3D" và "m" trong "Émanuel".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\W</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự không phải từ:</strong></a>
          Khớp với bất kỳ ký tự nào không phải ký tự từ trong bảng chữ cái
          Latin cơ bản. Tương đương với <code>[^A-Za-z0-9_]</code>. Ví dụ,
          <code>/\W/</code> hoặc <code>/[^A-Za-z0-9_]/</code> khớp với "%" trong "50%"
          và "É" trong "Émanuel".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\s</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự khoảng trắng:</strong></a>
          Khớp với một ký tự khoảng trắng đơn, bao gồm dấu cách, tab, form
          feed, line feed và các khoảng trắng Unicode khác. Tương đương với
          <code>[\f\n\r\t\v\u0020\u00a0\u1680\u2000-\u200a\u2028\u2029\u202f\u205f\u3000\ufeff]</code>. Ví dụ, <code>/\s\w*/</code> khớp với " bar" trong "foo bar".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\S</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Escape lớp ký tự không phải khoảng trắng:</strong></a>
          Khớp với một ký tự đơn không phải khoảng trắng. Tương đương với
          <code>[^\f\n\r\t\v\u0020\u00a0\u1680\u2000-\u200a\u2028\u2029\u202f\u205f\u3000\ufeff]</code>. Ví dụ, <code>/\S\w*/</code> khớp với "foo" trong "foo bar".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\t</code></td>
      <td>Khớp với một tab ngang.</td>
    </tr>
    <tr>
      <td><code>\r</code></td>
      <td>Khớp với một ký tự carriage return.</td>
    </tr>
    <tr>
      <td><code>\n</code></td>
      <td>Khớp với một ký tự linefeed.</td>
    </tr>
    <tr>
      <td><code>\v</code></td>
      <td>Khớp với một tab dọc.</td>
    </tr>
    <tr>
      <td><code>\f</code></td>
      <td>Khớp với một ký tự form-feed.</td>
    </tr>
    <tr>
      <td><code>[\b]</code></td>
      <td>
        Khớp với một ký tự backspace. Nếu bạn đang tìm kiếm assertion ranh giới từ
        (<code>\b</code>), xem
        <a
          href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions"
          >Assertions</a
        >.
      </td>
    </tr>
    <tr>
      <td><code>\0</code></td>
      <td>Khớp với ký tự NUL. Không được theo sau bởi một chữ số khác.</td>
    </tr>
    <tr>
      <td>
        <code>\c<em>X</em></code>
      </td>
      <td>
        <p>
          Khớp với một ký tự điều khiển sử dụng
          <a href="https://en.wikipedia.org/wiki/Caret_notation"
            >ký hiệu caret</a
          >, trong đó "X" là một chữ cái từ A–Z hoặc a–z (tương ứng với các code point
          <code>U+0001</code><em>–</em><code>U+001A</code>). Ví dụ,
          <code>/\cM\cJ/</code> khớp với "\r\n".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>\x<em>hh</em></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Hex escape:</strong></a>
        Khớp với ký tự có mã <code><em>hh</em></code> (hai
        chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\u<em>HHHH</em></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Unicode escape:</strong></a>
        Khớp với một đơn vị mã UTF-16 có giá trị
        <code><em>HHHH</em></code> (bốn chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\u{<em>H…H</em>}</code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Unicode code point escape:</strong></a>
        (Chỉ khi cờ <code>u</code> được đặt.) Khớp với ký tự có
        giá trị Unicode <code>U+<em>H…H</em></code> (1 đến 6 chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\p{<em>UnicodeProperty</em>}</code>,
        <code>\P{<em>UnicodeProperty</em>}</code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape"><strong>Escape lớp ký tự Unicode:</strong></a>
          Khớp với một ký tự dựa trên thuộc tính ký tự Unicode của nó: ví dụ, ký tự emoji, ký tự
          <em>katakana</em> tiếng Nhật, hoặc ký tự Han/Kanji tiếng Trung/Nhật,
          v.v.).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\</code></td>
      <td>
        <p>
          Chỉ ra rằng ký tự tiếp theo nên được xử lý đặc biệt, hay
          được "thoát". Nó hoạt động theo một trong hai cách.
        </p>
        <ul>
          <li>
            Đối với các ký tự thường được xử lý theo nghĩa đen, chỉ ra rằng
            ký tự tiếp theo là đặc biệt và không được hiểu theo nghĩa đen.
            Ví dụ, <code>/b/</code> khớp với ký tự "b". Bằng cách đặt
            một dấu gạch chéo ngược trước "b", tức là sử dụng <code>/\b/</code>, ký tự
            trở nên đặc biệt có nghĩa là khớp ranh giới từ.
          </li>
          <li>
            Đối với các ký tự thường được xử lý đặc biệt, chỉ ra rằng
            ký tự tiếp theo không đặc biệt và nên được hiểu
            theo nghĩa đen. Ví dụ, "*" là ký tự đặc biệt có nghĩa là 0 hoặc
            nhiều lần xuất hiện của ký tự trước đó phải được khớp; ví dụ,
            <code>/a*/</code> nghĩa là khớp 0 hoặc nhiều "a". Để khớp
            <code>*</code> theo nghĩa đen, đặt dấu gạch chéo ngược trước nó; ví dụ,
            <code>/a\*/</code> khớp với "a*".
          </li>
        </ul>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Để khớp ký tự này theo nghĩa đen, hãy thoát nó
            bằng chính nó. Nói cách khác, để tìm kiếm <code>\</code> hãy dùng
            <code>/\\/</code>.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>|<em>y</em></code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction"><strong>Disjunction:</strong></a>
          Khớp với "x" hoặc "y". Mỗi thành phần, được phân tách bởi dấu gạch đứng (<code>|</code>), được gọi là một <em>lựa chọn thay thế</em>. Ví dụ,
          <code>/green|red/</code> khớp với "green" trong "green apple" và "red" trong
          "red apple".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Một disjunction là một cách khác để chỉ định "một tập hợp các lựa chọn", nhưng nó không phải là một lớp ký tự. Các disjunction không phải là nguyên tử — bạn cần dùng một <a href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences">nhóm</a> để làm cho nó trở thành một phần của mẫu lớn hơn. <code>[abc]</code> về mặt chức năng tương đương với <code>(?:a|b|c)</code>.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

## Assertions

[Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions) bao gồm các ranh giới, chỉ ra điểm bắt đầu và kết thúc của các dòng và từ, và các mẫu khác chỉ ra theo một cách nào đó rằng một kết quả khớp là có thể (bao gồm look-ahead, look-behind và các biểu thức điều kiện).

### Assertions kiểu ranh giới

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>^</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion"><strong>Assertion đầu ranh giới đầu vào:</strong></a>
          Khớp với đầu đầu vào. Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline"><code>multiline</code></a> (m) được bật,
          cũng khớp ngay sau một ký tự ngắt dòng. Ví dụ,
          <code>/^A/</code> không khớp với "A" trong "an A", nhưng khớp với
          "A" đầu tiên trong "An A".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Ký tự này có ý nghĩa khác khi
            nó xuất hiện ở đầu một
            <a
              href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes"
              >lớp ký tự</a
            >.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>$</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion"><strong>Assertion cuối ranh giới đầu vào:</strong></a>
          Khớp với cuối đầu vào. Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline"><code>multiline</code></a> (m) được bật, cũng
          khớp ngay trước một ký tự ngắt dòng. Ví dụ,
          <code>/t$/</code> không khớp với "t" trong "eater", nhưng khớp với nó
          trong "eat".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\b</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion"><strong>Assertion ranh giới từ:</strong></a>
          Khớp với một ranh giới từ. Đây là vị trí mà một ký tự từ
          không được theo sau hoặc đứng trước bởi một ký tự từ khác, chẳng hạn như giữa
          một chữ cái và một dấu cách. Lưu ý rằng một ranh giới từ được khớp không được
          đưa vào kết quả khớp. Nói cách khác, độ dài của một ranh giới từ được khớp là bằng không.
        </p>
        <p>Ví dụ:</p>
        <ul>
          <li><code>/\bm/</code> khớp với "m" trong "moon".</li>
          <li>
            <code>/oo\b/</code> không khớp với "oo" trong "moon", vì "oo"
            được theo sau bởi "n" là một ký tự từ.
          </li>
          <li>
            <code>/oon\b/</code> khớp với "oon" trong "moon", vì "oon" là
            cuối chuỗi, do đó không được theo sau bởi một ký tự từ.
          </li>
          <li>
            <code>/\w\b\w/</code> sẽ không bao giờ khớp với bất kỳ thứ gì, vì một ký tự từ
            không bao giờ có thể được theo sau bởi cả một ký tự không phải từ và một ký tự từ.
          </li>
        </ul>
        <p>
          Để khớp với một ký tự backspace (<code>[\b]</code>), xem
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes"
            >Lớp ký tự</a
          >.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\B</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion"><strong>Assertion không phải ranh giới từ:</strong></a>
          Khớp với một ranh giới không phải từ. Đây là vị trí mà ký tự trước và
          sau có cùng loại: Cả hai phải là ký tự từ, hoặc
          cả hai phải là ký tự không phải từ, ví dụ như giữa hai chữ cái hoặc giữa hai
          dấu cách. Đầu và cuối chuỗi được coi là không phải từ.
          Giống như ranh giới từ được khớp, ranh giới không phải từ được khớp cũng
          không được đưa vào kết quả khớp. Ví dụ,
          <code>/\Bon/</code> khớp với "on" trong "at noon" và
          <code>/ye\B/</code> khớp với "ye" trong "possibly yesterday".
        </p>
      </td>
    </tr>
  </tbody>
</table>

### Các assertions khác

> [!NOTE]
> Ký tự `?` cũng có thể được dùng như một quantifier.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>x(?=y)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion"><strong>Assertion lookahead:</strong></a>
          Khớp với "x" chỉ khi "x" được
          theo sau bởi "y". Ví dụ, <code>/Jack(?=Sprat)/</code> khớp với
          "Jack" chỉ khi nó được theo sau bởi "Sprat".<br /><code
            >/Jack(?=Sprat|Frost)/</code
          >
          khớp với "Jack" chỉ khi nó được theo sau bởi "Sprat" hoặc "Frost". Tuy nhiên,
          cả "Sprat" lẫn "Frost" đều không phải là một phần của kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>x(?!y)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion"><strong>Assertion lookahead phủ định:</strong></a>
          Khớp với "x" chỉ khi "x"
          không được theo sau bởi "y". Ví dụ, <code>/\d+(?!\.)/</code> khớp với
          một số chỉ khi nó không được theo sau bởi dấu thập phân. <code
            >/\d+(?!\.)/.exec('3.141')</code
          >
          khớp với "141" nhưng không khớp với "3".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;=y)x</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion"><strong>Assertion lookbehind:</strong></a>
          Khớp với "x" chỉ khi "x" được
          đứng trước bởi "y". Ví dụ,
          <code>/(?&#x3C;=Jack)Sprat/</code> khớp với "Sprat" chỉ khi nó được
          đứng trước bởi "Jack". <code>/(?&#x3C;=Jack|Tom)Sprat/</code> khớp với
          "Sprat" chỉ khi nó được đứng trước bởi "Jack" hoặc "Tom". Tuy nhiên, cả
          "Jack" lẫn "Tom" đều không phải là một phần của kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;!y)x</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion"><strong>Assertion lookbehind phủ định:</strong></a>
          Khớp với "x" chỉ khi
          "x" không được đứng trước bởi "y". Ví dụ,
          <code>/(?&#x3C;!-)\d+/</code> khớp với một số chỉ khi nó không được
          đứng trước bởi dấu trừ. <code>/(?&#x3C;!-)\d+/.exec('3')</code>
          khớp với "3". <code>/(?&#x3C;!-)\d+/.exec('-3')</code> không tìm thấy kết quả khớp
          vì số được đứng trước bởi dấu trừ.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Nhóm và backreference

[Nhóm và backreference](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) chỉ ra các nhóm ký tự biểu thức.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>(<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group"><strong>Nhóm bắt giữ:</strong></a>
          Khớp với <code><em>x</em></code> và
          ghi nhớ kết quả khớp. Ví dụ, <code>/(foo)/</code> khớp và
          ghi nhớ "foo" trong "foo bar".
        </p>
        <p>
          Một biểu thức chính quy có thể có nhiều nhóm bắt giữ. Trong kết quả,
          các kết quả khớp với nhóm bắt giữ thường nằm trong một mảng có các thành phần theo
          cùng thứ tự như dấu ngoặc đơn trái trong nhóm bắt giữ. Đây thường
          chỉ là thứ tự của các nhóm bắt giữ. Điều này trở nên quan trọng khi các nhóm bắt giữ
          được lồng nhau. Các kết quả khớp được truy cập bằng chỉ mục của các phần tử trong kết quả (<code
            >[1], …, [n]</code
          >) hoặc từ các thuộc tính của đối tượng <code>RegExp</code> được định sẵn
          (<code>$1, …, $9</code>).
        </p>
        <p>
          Nhóm bắt giữ có một hình phạt về hiệu suất. Nếu bạn không cần
          chuỗi con được khớp để được ghi nhớ, hãy ưu tiên dấu ngoặc đơn không bắt giữ
          (xem bên dưới).
        </p>
        <p>
          <code
            ><a
              href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match"
              >String.prototype.match()</a
            ></code
          >
          sẽ không trả về các nhóm nếu cờ <code>/.../g</code> được đặt. Tuy nhiên,
          bạn vẫn có thể dùng
          <code
            ><a
              href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll"
              >String.prototype.matchAll()</a
            ></code
          >
          để lấy tất cả kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;Name>x)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group"><strong>Nhóm bắt giữ có tên:</strong></a>
          Khớp với "x" và lưu trữ nó vào
          thuộc tính groups của kết quả khớp được trả về dưới tên được chỉ định
          bởi <code>&#x3C;Name></code>. Dấu ngoặc góc (<code>&#x3C;</code>
          và <code>></code>) là bắt buộc cho tên nhóm.
        </p>
        <p>
          Ví dụ, để trích xuất mã vùng Hoa Kỳ từ một số điện thoại,
          chúng ta có thể dùng <code>/\((?&#x3C;area>\d\d\d)\)/</code>. Kết quả
          số sẽ xuất hiện trong <code>matches.groups.area</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?:<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group"><strong>Nhóm không bắt giữ:</strong></a>
          Khớp với "x" nhưng không ghi nhớ
          kết quả khớp. Chuỗi con được khớp không thể được truy xuất từ các phần tử của mảng kết quả (<code>[1], …, [n]</code>) hoặc từ các thuộc tính
          của đối tượng <code>RegExp</code> được định sẵn (<code>$1, …, $9</code>).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?<em>flags</em>:<em>x</em>)</code>, <code>(?<em>flags</em>-<em>flags</em>:<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier"><strong>Modifier:</strong></a>
          Bật hoặc tắt các cờ được chỉ định chỉ cho mẫu được bao gồm. Chỉ các cờ <code>i</code>, <code>m</code> và <code>s</code> có thể được dùng trong một modifier.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>\<em>n</em></code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference"><strong>Backreference:</strong></a>
          Trong đó "n" là một số nguyên dương. Khớp với cùng chuỗi con được khớp bởi
          nhóm bắt giữ thứ n trong biểu thức chính quy
          (đếm dấu ngoặc đơn trái). Ví dụ,
          <code>/apple(,)\sorange\1/</code> khớp với "apple, orange," trong "apple,
          orange, cherry, peach".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\k&#x3C;Name></code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference"><strong>Backreference có tên:</strong></a>
          Một tham chiếu ngược đến chuỗi con cuối cùng khớp với
          <strong>nhóm bắt giữ có tên</strong> được chỉ định bởi
          <code>&#x3C;Name></code>.
        </p>
        <p>
          Ví dụ,
          <code>/(?&#x3C;title>\w+), yes \k&#x3C;title>/</code> khớp với "Sir,
          yes Sir" trong "Do you copy? Sir, yes Sir!".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> <code>\k</code> được dùng theo nghĩa đen ở đây để
            chỉ ra đầu của một tham chiếu ngược đến nhóm bắt giữ có tên.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

## Quantifiers

[Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers) chỉ ra số lượng ký tự hoặc biểu thức cần khớp.

> [!NOTE]
> Trong phần sau, _item_ không chỉ đề cập đến các ký tự đơn lẻ, mà còn bao gồm [lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) và [nhóm và backreference](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences).

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code><em>x</em>*</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 0 hoặc nhiều lần. Ví dụ,
          <code>/bo*/</code> khớp với "boooo" trong "A ghost booooed" và "b" trong "A
          bird warbled", nhưng không khớp với bất kỳ thứ gì trong "A goat grunted".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>+</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 1 hoặc nhiều lần. Tương đương với
          <code>{1,}</code>. Ví dụ, <code>/a+/</code> khớp với "a" trong
          "candy" và tất cả các "a" trong "caaaaaaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>?</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 0 hoặc 1 lần. Ví dụ,
          <code>/e?le?/</code> khớp với "el" trong "angel" và "le" trong
          "angle."
        </p>
        <p>
          Nếu được dùng ngay sau bất kỳ quantifier nào trong số <code>*</code>,
          <code>+</code>, <code>?</code> hoặc <code>{}</code>, làm cho
          quantifier trở nên non-greedy (khớp số lần tối thiểu), ngược lại
          với mặc định là greedy (khớp số lần tối đa).
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>}</code>
      </td>
      <td>
        <p>
          Trong đó "n" là một số nguyên không âm, khớp chính xác "n" lần xuất hiện của
          item "x" đứng trước. Ví dụ, <code>/a{2}/</code> không khớp với
          "a" trong "candy", nhưng nó khớp với tất cả "a" trong "caandy" và
          hai "a" đầu tiên trong "caaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>,}</code>
      </td>
      <td>
        <p>
          Trong đó "n" là một số nguyên không âm, khớp ít nhất "n" lần xuất hiện của
          item "x" đứng trước. Ví dụ, <code>/a{2,}/</code> không
          khớp với "a" trong "candy", nhưng khớp với tất cả a trong "caandy" và
          trong "caaaaaaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>,<em>m</em>}</code>
      </td>
      <td>
        <!-- cSpell:ignore cndy -->
        <p>
          Trong đó "n" và "m" là các số nguyên không âm và <code>m >= n</code>,
          khớp ít nhất "n" và tối đa "m" lần xuất hiện của item
          "x" đứng trước. Ví dụ, <code>/a{1,3}/</code> không khớp với bất kỳ thứ gì trong
          "cndy", khớp "a" trong "candy", hai "a" trong "caandy" và ba
          "a" đầu tiên trong "caaaaaaandy". Lưu ý rằng khi khớp "caaaaaaandy",
          kết quả khớp là "aaa", mặc dù chuỗi gốc có nhiều "a" hơn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <code><em>x</em>*?</code><br /><code><em>x</em>+?</code><br /><code
            ><em>x</em>??</code
          ><br /><code><em>x</em>{n}?</code><br /><code><em>x</em>{n,}?</code
          ><br /><code><em>x</em>{n,m}?</code>
        </p>
      </td>
      <td>
        <p>
          Mặc định các quantifier như <code>*</code> và <code>+</code> là
          "greedy", nghĩa là chúng cố gắng khớp nhiều lần nhất có thể. Ký tự <code>?</code> sau quantifier làm cho
          quantifier trở thành "non-greedy": nghĩa là nó sẽ dừng lại ngay khi tìm thấy số kết quả khớp tối thiểu. Ví dụ, cho một chuỗi như "some &#x3C;foo> &#x3C;bar>
          new &#x3C;/bar> &#x3C;/foo> thing":
        </p>
        <ul>
          <li>
            <code>/&#x3C;.*>/</code> sẽ khớp với "&#x3C;foo> &#x3C;bar> new
            &#x3C;/bar> &#x3C;/foo>"
          </li>
          <li><code>/&#x3C;.*?>/</code> sẽ khớp với "&#x3C;foo>"</li>
        </ul>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Thêm <code>?</code> sau <code>{n}</code> là hợp lệ về mặt cú pháp nhưng thực tế không có ý nghĩa gì.
            Vì <code>{n}</code> luôn khớp chính xác n lần, <code>x{n}?</code> hoạt động giống như <code>x{n}</code>.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>
