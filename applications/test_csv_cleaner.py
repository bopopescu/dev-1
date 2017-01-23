#!/usr/bin/env python
from csv_cleaner import remove_whitspace, string_clean, code_swap, ABBREVIATION_CSV
import pytest
import pandas as pd
TEST_FILE = 'data/sven_test.csv'


def test_remove_whitsepace_all_whitespace_chars_i_can_think_of():
    assert remove_whitspace("\n\nHello\fMy\tFriends \v\v asdfsf\rsdf\t") == "Hello My Friends asdfsf sdf"


def test_remove_whitsepace_only_whitespace():
    assert remove_whitspace("\n\n\t") == ""


@pytest.fixture
def clean_df():
    return string_clean(TEST_FILE)


def test_string_clean_first_line_in_sample(clean_df):
    assert clean_df.bio[0] == "Autem vero aliquid repellendus illo distinctio. Reiciendis excepturi aut ducimus sint dignissimos et. Similique sunt et ullam sit."


def test_string_clean_with_many_tabs_new_lines(clean_df):
    assert clean_df.bio[1] == "Hello My Friends asdfsf sdf"


@pytest.fixture
def swapped_df():
    df = pd.read_csv(TEST_FILE)
    return code_swap(df, ABBREVIATION_CSV)


def test_code_swap_first_line_in_sample(swapped_df):
    assert swapped_df.state[0] == "Louisiana"


def test_code_swap_nonsense_converted_to_unknown(swapped_df):
    assert swapped_df.state[2] == "Unknown"
