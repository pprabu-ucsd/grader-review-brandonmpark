import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class TrueStringChecker implements StringChecker {
    public boolean checkString(String s) {
        return true;
    }
}

class LengthStringChecker implements StringChecker {
    public boolean checkString(String s) { return s.length() > 2;}
}

public class TestListExamples {
    @Test
    public void testFilter() {
        List<String> l1 = new ArrayList<>(Arrays.asList("a", "b", "c"));
        assertArrayEquals(l1.toArray(), ListExamples.filter(l1,
                new TrueStringChecker()).toArray());
    }

    @Test
    public void testFilter2() {
        List<String> l1 = new ArrayList<>(Arrays.asList("a", "ab", "abc",
                "abcd"));
        assertArrayEquals(new String[]{"abc", "abcd"}, ListExamples.filter(l1,
                new LengthStringChecker()).toArray());
    }

    @Test
    public void testMerge1() {
        List<String> l1 = new ArrayList<>(Arrays.asList("x", "y"));
        List<String> l2 = new ArrayList<>(Arrays.asList("a", "b"));
        assertArrayEquals(new String[]{"a", "b", "x", "y"},
                ListExamples.merge(l1, l2).toArray());
    }

    @Test
    public void testMerge2() {
        List<String> l1 = new ArrayList<>(Arrays.asList("a", "b", "c"));
        List<String> l2 = new ArrayList<>(Arrays.asList("c", "d", "e"));
        assertArrayEquals(new String[]{ "a", "b", "c", "c", "d", "e" },
                ListExamples.merge(l1, l2).toArray());
    }
}
