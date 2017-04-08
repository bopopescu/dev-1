#!/usr/bin/env python
import pandas as pd

TEST_CSV = 'data/test.csv'
ABBREVIATION_CSV = 'data/state_abbreviations.csv'
OUTPUT_CSV = 'output/solutions.csv'


def remove_whitspace(s):
    """Convert's whitespace between non-whitespace characters in a string s
     to single spaces"""
    # split() splits on all adjacent whitespace by default.
    # i.e. "a \n \t b".split() -> ['a','b']
    return " ".join(s.split())


def string_clean(filename, column='bio'):
    """ Removes whitespace from all rows in column in csv data at filename

    Args:
        filename: String location of a csv file
        column: Column of csv data containing strings to be cleaned

    Returns:
        Pandas Dataframe of data contained in filename with cleaned column
    """
    df = pd.read_csv(filename)

    df[column] = df[column].astype(str)
    df[column] = df[column].apply(remove_whitspace)

    return df


def code_swap(df, abbreviation_file, column='state'):
    """ Converts abbreviations to their full names.

    Args:
        df: A Pandas Dataframe whose abbreviation column is to be modified.
        abbreviation_file: CSV file that matches abbreviations with full names.
        column: Column in df containing abbreviations as strings.

    Returns:
        Pandas Dataframe with column's rows containing full name instead of
        their original abbreviation values.
    """

    abbreviations = pd.read_csv(abbreviation_file)

    def get_abbreviation(a, abbr_col="state_abbr", full_name_col='state_name'):
        abbr = a.strip()

        full_name = abbreviations.loc[abbreviations[abbr_col] == abbr][full_name_col].to_string(index=False)
        # If abbreviation not found
        if full_name == 'Series([], )':
            # Future Improvement: Could get state from zipcode
            full_name = "Unknown"

        return full_name
    df.state = df.state.astype(str)
    df.state = df[column].apply(get_abbreviation)

    return df

if __name__ == '__main__':
    # 1-1
    df = string_clean(TEST_CSV)
    print "Cleaned bio field of whitespace"

    # 1-2
    df = code_swap(df, ABBREVIATION_CSV)
    print "Replaced state abbreviations with their full names"

    df.to_csv(OUTPUT_CSV)
    print "Wrote cleaned data to %s" % OUTPUT_CSV
