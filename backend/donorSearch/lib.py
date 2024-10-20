from multiprocessing import process
from fuzzywuzzy import process

def search_with_ratio(search_term, choices):
    # Use process.extract to find best matches
    matches = process.extract(search_term, choices, limit=None)    
    # Filter results to include only matches with a ratio above a threshold (e.g., 60)
    results = [(match[0], match[1]) for match in matches if match[1] >= 70]    
    return results

