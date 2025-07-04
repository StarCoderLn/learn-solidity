/**
 * 1.对于临时变量，编译器会自动选择memory(按值传递)或storage (引用 址)。 变长数据类型二选一
 * 2.如果返回数据类型是变长的 需要memory修饰一下 string bytes 数组 自定义结构的
 * 3.storage (引用 址) C++指针
 * 4.memory修饰的临时变量相当于右值的一个拷贝，对其进行的修改不会影响到本尊。
 */
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct User {
    string name;
    uint8 age;
    string sex;
}

contract storage_demo {
    User adminUser;

    function setUser(
        string memory _name,
        uint8 _age,
        string memory _sex
    ) public {
        adminUser.name = _name;
        adminUser.age = _age;
        adminUser.sex = _sex;
    }

    function getUser() public view returns (User memory) {
        return adminUser;
    }

    function setAge1(uint8 _age) public view {
        User memory user = adminUser;
        user.age = _age;
    }

    function setAge2(uint8 _age) public {
        User storage user = adminUser;
        user.age = _age;
    }
}
